# Intellij
* project structure -> make sure sdk is correct
* for scala, use jdk 11 as 17 caused me issues

## run tests using sbt
1. Settings / Preferences
2. Build, Execution, Deployment → Build Tools → sbt
3. Set:
    * Run tests using: sbt
    * Build using: sbt
    * Restart IntelliJ after changing this.
4. Now:
    * Clicking ▶️ runs sbt testOnly
    * Your build.sbt JVM options apply
    * Behavior matches Docker and terminal
