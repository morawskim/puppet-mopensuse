class mopensuse::packages::texlive_latex_bin_bin (
  $ensure = 'present'
) {

  package { 'texlive-latex-bin-bin':
    ensure => $ensure,
  }
}
