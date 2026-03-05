use strict;

my $base   = "2026-02-xx";
my $config = "2026-02-01";
foreach my $i (1..28) {
    my $jj = "$i"; $jj =~ s/^(\d)$/0$1/;
    my $tar = $base; $tar =~ s/xx/$jj/;

    if (-e './data/tar/transfert/'.$tar.'_sinp_paca_cenpaca.tar.bz2') {
        die "Le fichier ".'./data/tar/transfert/'.$tar.'_sinp_paca_cenpaca.tar.bz2'." n'existe pas\n\n";
    }

    system('rm ./data/raw/*_sinp_paca_cenpaca.tar.bz2');
    system('cp ./data/tar/transfert/'.$tar.'_sinp_paca_cenpaca.tar.bz2 ./data/raw/'.$config.'_sinp_paca_cenpaca.tar.bz2');

    system('reset; rm -f data/raw/*csv; ./bin/import_data.sh');
    my $nblines = `grep -i error var/log/* | wc -l`;
    $nblines =~ s/^(\d+)\s.*$/$1/;
    $nblines =~ s/[\n\r"]//g;
    if ($nblines>0) {
        die "Erreur dans ".$tar."_sinp_paca_cenpaca.tar.bz2\n\n";
    }
}

#system('sed','-i -e ','s/2026-02-'.$old.'/2026-02-'.$new.'/', 'config/settings.ini');
