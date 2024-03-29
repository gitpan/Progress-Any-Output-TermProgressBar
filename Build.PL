
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Output progress to terminal using Term::ProgressBar",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Progress-Any-Output-TermProgressBar",
  "dist_version" => "0.02",
  "license" => "perl",
  "module_name" => "Progress::Any::Output::TermProgressBar",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Progress::Any" => "0.01",
    "Term::ProgressBar" => 0,
    "perl" => "5.010"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
