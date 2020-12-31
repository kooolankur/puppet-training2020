class mod2($fname,$fpermission)
{
  class { 'mod2::modtwofile':
     filename => "$fname",
     filepermission => "$fpermission"
  }
}
