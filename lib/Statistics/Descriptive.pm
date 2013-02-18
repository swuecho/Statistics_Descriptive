module Statistics::Descriptive;

sub mean(@data) is export {
   ([+] @data) / @data;
}


sub var(@data) is export {
    my $mean = mean(@data);
    ([+] map { ($_ - $mean)**2 }, @data) / (@data - 1) ;
}


sub sd(@data) is export {
   sqrt(var(@data));
}


sub prod(@data) is export {
   [*] @data;
}

sub cov(@x,@y) is export {
	my $mean_x = mean(@x);
        my $mean_y = mean(@y);
       ([+] (@x >>->> $mean_x) >>*<< (@y >>->> $mean_y)) / (@x - 1);
}

sub cor(@x,@y) is export {
	cov(@x,@y)/sqrt(var(@x)*var(@y));
}

sub pmin (@a, @b) is export {
	@a >>min<< @b;
}

sub pmax (@a,@b)  is export {
	@a >>max<< @b;
}
