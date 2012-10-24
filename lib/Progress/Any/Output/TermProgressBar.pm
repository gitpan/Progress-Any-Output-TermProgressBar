package Progress::Any::Output::TermProgressBar;

# this output only supports 1 indicator, doesn't support undefined target,

use 5.010;
use strict;
use warnings;

our $VERSION = '0.02'; # VERSION

# TODO: allow customizing Term::ProgressBar

sub new {
    my ($class, %args) = @_;
    bless \%args, $class;
}

sub _tpb {
    require Term::ProgressBar;
    state $tpb;
    if (!$tpb) {
        $tpb = Term::ProgressBar->new({
            ETA    => 'linear',
            count  => 100, # dummy
            remove => 1,
        });
        $tpb->minor(0);
    }
    $tpb;
}

sub _message {
    my $self = shift;
    my $tpb = $self->_tpb;
    $tpb->message(@_);
}

sub update {
    my ($self, %args) = @_;

    if (defined $args{target}) {
        my $tpb = $self->_tpb;
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

version 0.02

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

