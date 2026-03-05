use strict;

my $base   = "2026-02-xx";
my $config = "2026-02-01";
foreach my $i (1..28) {
    my $jj = "$i"; $jj =~ s/^(\d)$/0$1/;
    my $tar = $base; $tar =~ s/xx/$jj/;

    if (!exists './data/tar/transfert/'.$tar.'_sinp_paca_cenpaca.tar.bz2') {
        die "Le fichier ".'./data/tar/transfert/'.$tar.'_sinp_paca_cenpaca.tar.bz2'." n'existe pas\n\n";
    }

    system('rm ./data/raw/*_sinp_paca_cenpaca.tar.bz2');
    system('cp ./data/tar/transfert/'.$tar.'_sinp_paca_cenpaca.tar.bz2 ./data/raw/'.$config.'_sinp_paca_cenpaca.tar.bz2');

    system('reset; rm -f data/raw/*csv; ./bin/import_data.sh');
}

#system('sed','-i -e ','s/2026-02-'.$old.'/2026-02-'.$new.'/', 'config/settings.ini');
