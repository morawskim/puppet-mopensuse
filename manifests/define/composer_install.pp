# -d, --working-dir=WORKING-DIR  If specified, use the given directory as working directory.
# --prefer-source            Forces installation from package sources when possible, including VCS information.
# --prefer-dist              Forces installation from package dist even for dev versions.
# --dev                      Enables installation of require-dev packages (enabled by default, only present for BC).
# --ignore-platform-reqs     Ignore platform requirements (php & ext- packages).
define mopensuse::define::composer_install (
  String $workingDir,
  String $user,
  String $userHome,

  Boolean $preferSource = true,
  Boolean $preferDist = false,
  Boolean $dev = true,
  Boolean $ignorePlatformReqs = true,
) {

  if ($preferSource) {
    $prefer = '--prefer-source'
  } elsif ($preferDist) {
    $prefer = '--prefer-dist'
  } else {
    $prefer = ''
  }

  if ($dev) {
    $devArg = '--dev'
  } else {
    $devArg = '--no-dev'
  }

  if ($ignorePlatformReqs) {
    $ignorePlatformReqsArg = '--ignore-platform-reqs'
  } else {
    $ignorePlatformReqsArg = ''
  }

  $cmd = "composer install --no-interaction --no-ansi --working-dir=${workingDir} ${prefer} ${devArg} ${ignorePlatformReqsArg}"

  exec{ "${title}_composer_install":
    command     => $cmd,
    cwd         => $workingDir,
    path        => ['/opt/php/php56v/usr/bin', '/bin', '/usr/bin', '/usr/local/bin/'],
    timeout     => 0,
    creates     => "${workingDir}/vendor/autoload.php",
    user        => $user,
    environment => ["HOME=$userHome"],
  }
}
