use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'DBIx::Database',
    'VERSION_FROM' => 'Database.pm', # finds $VERSION
    'PREREQ_PM'    => {
                        'DBI' => 0,
                      },
);
