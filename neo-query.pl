#!/usr/bin/env perl
use strict;
use Net::HTTP::Spore;
use Data::Dumper;
use Try::Tiny;

# Create a Neo4j client
my $client = Net::HTTP::Spore->new_from_spec('neo4j.json', trace => '1=log.txt');
$client->enable( 'Redirection', max_redirect => 100 );
$client->enable('Format::JSON');

my $results = $client->query_index( index => "fieldvalues", key => 'name', q => 'It' );

print Dumper $results;
