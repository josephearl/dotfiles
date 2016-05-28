function __cache_or_get_gradle_completion
  mkdir -p "/tmp/gradle_completion_cache_for_$USER"
  set -l hashed_pwd (echo $PWD | md5sum | awk '{ print $1 }')
  set -l gradle_cache_file "/tmp/gradle_completion_cache_for_$USER/$hashed_pwd"
  if /usr/bin/test build.gradle -nt "$gradle_cache_file"; or not test -f "$gradle_cache_file"
    gradle -q tasks ^ /dev/null | sed -n 's/^\([[:alpha:][:digit:]]\{1,\}\)\s-\s.*/\1/p' > "$gradle_cache_file"
  end
  cat "$gradle_cache_file"
end

function __description_gradle_completion
  cat "$gradle_cache_file"
end

function __run_gradle_completion
  test -f build.gradle
end

complete -x -c gradle -a "(__cache_or_get_gradle_completion)" -n '__run_gradle_completion'

complete -c gradle -s 'a' -l 'no-rebuild' -d "Do not rebuild project dependencies."
complete -c gradle -s 'b' -l 'build-file' -d "Specifies the build file."
complete -c gradle -s 'c' -l 'settings-file' -d "Specifies the settings file."
complete -c gradle -l 'configure-on-demand' -d "Only relevant projects are configured in this build run. This means faster build for large multi-project builds. [incubating]"
complete -c gradle -l 'console' -d "Specifies which type of console output to generate. Values are 'plain', 'auto' (default) or 'rich'."
complete -c gradle -l 'continue' -d "Continues task execution after a task failure."
complete -c gradle -s 'D' -l 'system-prop' -d "Set system property of the JVM (e.g. -Dmyprop=myvalue)."
complete -c gradle -s 'd' -l 'debug' -d "Log in debug mode (includes normal stacktrace)."
complete -c gradle -l 'daemon' -d "Uses the Gradle daemon to run the build. Starts the daemon if not running."
complete -c gradle -l 'foreground' -d "Starts the Gradle daemon in the foreground. [incubating]"
complete -c gradle -s 'g' -l 'gradle-user-home' -d "Specifies the gradle user home directory."
complete -c gradle -l 'gui' -d "Launches the Gradle GUI."
complete -c gradle -s 'I' -l 'init-script' -d "Specifies an initialization script."
complete -c gradle -s 'i' -l 'info' -d "Set log level to info."
complete -c gradle -s 'm' -l 'dry-run' -d "Runs the builds with all task actions disabled."
complete -c gradle -l 'max-workers' -d "Configure the number of concurrent workers Gradle is allowed to use. [incubating]"
complete -c gradle -l 'no-color' -d "Do not use color in the console output. [deprecated - use --console=plain instead]"
complete -c gradle -l 'no-daemon' -d "Do not use the Gradle daemon to run the build."
complete -c gradle -l 'offline' -d "The build should operate without accessing network resources."
complete -c gradle -s 'P' -l 'project-prop' -d "Set project property for the build script (e.g. -Pmyprop=myvalue)."
complete -c gradle -s 'p' -l 'project-dir' -d "Specifies the start directory for Gradle. Defaults to current directory."
complete -c gradle -l 'parallel' -d "Build projects in parallel. Gradle will attempt to determine the optimal number of executor threads to use. [incubating]"
complete -c gradle -l 'parallel-threads' -d "Build projects in parallel, using the specified number of executor threads. [deprecated - Please use --parallel, optionally in conjunction with --max-workers.] [incubating]"
complete -c gradle -l 'profile' -d "Profiles build execution time and generates a report in the <build_dir>/reports/profile directory."
complete -c gradle -l 'project-cache-dir' -d "Specifies the project-specific cache directory. Defaults to .gradle in the root project directory."
complete -c gradle -s 'q' -l 'quiet' -d "Log errors only."
complete -c gradle -l 'recompile-scripts' -d "Force build script recompiling."
complete -c gradle -l 'refresh-dependencies' -d "Refresh the state of dependencies."
complete -c gradle -l 'rerun-tasks' -d "Ignore previously cached task results."
complete -c gradle -s 'S' -l 'full-stacktrace' -d "Print out the full (very verbose) stacktrace for all exceptions."
complete -c gradle -s 's' -l 'stacktrace' -d "Print out the stacktrace for all exceptions."
complete -c gradle -l 'stop' -d "Stops the Gradle daemon if it is running."
complete -c gradle -s 'u' -l 'no-search-upward' -d "Don't search in parent folders for a settings.gradle file."
complete -c gradle -s 'v' -l 'version' -d "Print version info."
complete -c gradle -s 'x' -l 'exclude-task' -d "Specify a task to be excluded from execution."
