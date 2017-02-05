class mopensuse::zypper::repositories::vivaldi(
    $enabled = 1
) {
  
  include mopensuse::zypper::refresh
  
  $gpg_key = "https://gist.githubusercontent.com/morawskim/dcee4dd70958c4e9ede389c45f7f8d5f/raw/c47323f1cd395b5c79d0fc23cd2bdb19b6b302df/vivaldi_gpg.pub"
  $gpg_future_key = 'https://gist.githubusercontent.com/morawskim/34a411a7e10c73ae79d89c00b2b644bb/raw/c198f2b4b130cb574665d3eae16cf1cde4d6e6b9/vivaldi_future_gpg.pub'
  
  zypprepo {'vivaldi':
    baseurl      => "http://repo.vivaldi.com/archive/rpm/x86_64",
    enabled      => $enabled,
    autorefresh  => 1,
    descr        => "Vivaldi repository",
    gpgcheck     => 1,
    gpgkey       => $gpg_key,
    type         => 'rpm-md',
    notify       => Class['mopensuse::zypper::refresh']
  }
  
  rpmkey {'BF1700F8':
    ensure  => present,
    source  => $gpg_key,
    before  => Zypprepo['vivaldi']
  }
  
  rpmkey {'7B8B44A1':
      ensure  => present,
      source  => $gpg_future_key,
      before  => Zypprepo['vivaldi']
  }

}
