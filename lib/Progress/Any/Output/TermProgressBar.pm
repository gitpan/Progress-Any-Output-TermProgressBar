package Progress::Any::Output::TermProgressBar;

# this output only supports 1 indicator, doesn't support undefined target,

use 5.010;
use strict;
use warnings;

use Term::ProgressBar;

our $VERSION = '0.01'; # VERSION

# TODO: allow customizing Term::ProgressBar

sub new {
    my ($class, %args) = @_;
    bless \%args, $class;
}

sub update {
    my ($self, %args) = @_;

    state $tpb = Term::ProgressBar->new({
        ETA=>'linear',
        count=>100, # dummy
    });

    my $msg = $args{message};
    return unless defined($msg);

    if (defined $args{target}) {
        $tpb->target($args{target});
        $tpb->update($args{pos});
    }
}

1;
# ABSTRACT: Output progress to terminal using Term::ProgressBar


__END__
=pod

=head1 NAME

Progress::Any::Output::TermProgressBar - Output progress to terminal using Term::ProgressBar

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Progress::Any '$progress';
 use Progress::Any::Output::TermProgressBar;

 Progress::Any->set_output(
     output => Progress::Any::Output::TermProgressBar->new(
         # options
     ),
 );

 $progress->init(target=>4);
 do { $progress->update(message=>"Test"); sleep 1 } for 1..4;

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

