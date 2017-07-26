#!/usr/bin/env perl
#===============================================================================
#
#         FILE: data_structures_tutorial.pl
#
#        USAGE: ./data_structures_tutorial.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: nebbia (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 07/25/2017 12:20:18 AM
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use Data::Dumper;


# Hint: When we say Array of Arrays we think about 
# an array who contains a list of references to other arrays
# or when for example we say Hashes of Arrays we think about
# hashes containing for each entry a reference to an array
# and so on...
#
# A reference is a scalar data type

my $scalar = "ciao";

my $ref = \$scalar;

# We can think about $ref as a little box pointing to $scalar
# if we say $ref, we see something like a memory address
# so SCALAR(0x29ab23)

# If we want to use the value pointed by a reference
# we must do what is called "dereference" the reference
# in order to do this in our case we just wrap our "reference" inside {}
# brackets

say ${$ref};

# We can reference anything, for example, let's say we have a reference to a
# list or a hash, for example:

my @simple_list = (0..10);
$ref = \@simple_list;

# Again in order to dereference we wrap the reference in {} brackets,
# let's see some example use...


my @another_list = ('a'..'z');
push @{$ref}, @another_list;

say ${$ref}[0];

# We can remove a $ and a pair of brackets {} (i.e., ${})
# by using the arrow symbol, so the previous code line is equivalent to:

say $ref->[0];


# Let's do the same thing for hashes
my %hash = ( 
    name  => "marco",
    surname => "martorana",
); 

$ref = \%hash;

my @values = values %{$ref};

say ${$ref}{"name"};

# We can use the short arrow notation by doing:

say $ref->{"name"};

# Sometimes we want to have a reference to a list and we could (redundantly)
# do:

my $newref;
{
    my @temp_list = (1..5);
    $newref = \@temp_list;
}
# but a shortcut to this is to use an "anonymous list" and do:

$newref = [(1..5)];

# we can even create anonymous hashes by using {} brackets

$newref = {
    primo => "first",
    secondo => "second",
};

# Now let's deal with more complex structures...

my @list1 = qw(this is a simple list 23 55);
my @list2 = ("another", "simple", "list", 42);

# Creation of an Array of Arrays
my @AoA = ( [@list1], [@list2] );

# Dumper say of Array of Arrays
say Dumper @AoA;

# Inserting a new element in an Array of Arrays
push @AoA, [@list2];


# Creation of an Array of Hashes
my @AoH = ( 
    {
        name    =>  "giuseppe",
        course  =>  "computer science",
    },
    {
        name    =>  "giovanni",
        course  =>  "geology",
    },
);

# Dumper say of an Array of Hashes
say Dumper @AoH;

# I create a dummy hash in order to insert it in the AoH
my %dummy_hash = (
    name      =>  "anna",
    surname   =>  "biology",
);

# Insert a new element in an Array of Hashes
push @AoH, {%dummy_hash};

say Dumper @AoH;

# Print the name of the first element of the AoH
say $AoH[0]{'name'};


# Creation of an Hash of Arrays
my %HoA = (
    first  => [qw(wdaid dwidnwa wdai wa)],
    second => [qw(wdaid dwidnwa wdai wa)],
    third => [qw(wdaid dwidnwa wdai wa)],
);

say Dumper %HoA;

$HoA{'fourth'} = [qw(dwaindwai  dwain  awidnal alawsooszzo)];

say Dumper %HoA;

say $HoA{'fourth'}[0];


my %HoH = (
    person1  => { 
        name => "joe",
        surname => "rossi",
        date    => "212121",
    }, 
    person2  => { 
        name => "sayid",
        surname => "ford",
        date    => "212121092181",
    }, 
    person3  => { 
        name => "andrea",
        surname => "wang",
        date    => "99918192081",
    },
);


say Dumper %HoH;



say $HoH{'person3'}{'name'};


my $c_ds = \%HoH;



say Dumper $c_ds;


say $c_ds->{'person3'}{'name'};



