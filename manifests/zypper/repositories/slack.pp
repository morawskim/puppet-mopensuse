class mopensuse::zypper::repositories::slack(
    $enabled = 1
) {

  if $::operatingsystemrelease > 13.2 {
    $dist_key = "openSUSE_Leap_${::operatingsystemrelease}"
  } else {
    $dist_key = "openSUSE_${::operatingsystemrelease}"
  }
  include mopensuse::zypper::refresh

  $gpg_packagecloud = "https://gist.githubusercontent.com/morawskim/8d169cd436bad32bdd034054255db796/raw/7123e2d371cc3d7889a97107d7b4a6f054481b64/gpg_packagecloud.pub"
  $gpg_slack = 'https://gist.githubusercontent.com/morawskim/e417ad8c063ee32c5791777935c588eb/raw/948787b82ed6e98ac382fecf003d719f0f0c23c2/slack_gpg.pub'
  $gpg_repo = 'https://packagecloud.io/gpg.key'

  zypprepo {'slack':
    baseurl      => "https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Slack",
    gpgcheck     => 0,
    gpgkey       => $gpg_repo,
    type         => 'rpm-md',
    keeppackages => 0,
    notify       => Class['mopensuse::zypper::refresh']
  }

  rpmkey {'D59097AB':
    ensure  => present,
    source  => $gpg_packagecloud,
    before  => Zypprepo['slack']
  }

  rpmkey {'038651BD':
      ensure  => present,
      source  => $gpg_slack,
      before  => Zypprepo['slack']
  }
}
