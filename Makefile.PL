
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Google Voice service helper',
  'AUTHOR' => 'Glen Hinkle <tempire@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::Mojo' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Google-Voice',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Google::Voice',
  'PREREQ_PM' => {
    'IO::Socket::SSL' => '0',
    'Mojo::Base' => '0',
    'Mojo::ByteStream' => '0',
    'Mojo::Client' => '0',
    'Mojo::JSON' => '0',
    'constant' => '0'
  },
  'VERSION' => '0.0101',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



