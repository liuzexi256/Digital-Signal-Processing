%a = {'A', 'dejected', 'and', 'fearful', 'Wizard', 'watches', 'from', 'the', 'corner'};
a = {'an', 'angry', 'wizard', 'resembles', 'a', 'dragon'};
%a = {'the', 'angry', 'wizard', 'resembles', 'a', 'dragon'};
%a = {'yet', 'gigantic', 'ray', 'granite', 'continuation', 'sole', 'leader', 'lane', 'motion', 'despoiled'};

tn = [];
c1_max = 0;
c2_max = 0;

for n = 1:4436
	tf = strcmp(vocabulary(n),a);
	tn(n) = sum(tf);
end

for n = 1:1734
	prec1 = tn.*counts(n,:);
	c1 = sum(prec1);
	if c1 > c1_max
		c1_max = c1;
		fg_number_c1 = n;
	else
		c1_max = c1_max;
	end
end

ctn = sum(tn.*tn);
for n = 1:1734
	prec1 = tn.*counts(n,:);
	c1 = sum(prec1);
	cdoc = sum(counts(n,:).*counts(n,:));
	c2 = c1/(((ctn)^(1/2))*(cdoc)^(1/2));
	if c2 > c2_max
		c2_max = c2;
		fg_number_c2 = n;
	else
		c2_max = c2_max;
	end
end

n_c1 = ['c1_max = ', num2str(c1_max)];
n_fg1 = ['the best matching text fragment for c1 is', documents(fg_number_c1,1)];
n_c2 = ['c2_max = ', num2str(c2_max)];
n_fg2 = ['the best matching text fragment for c2 is', documents(fg_number_c2,1)];
disp(n_c1);
disp(n_fg1);
disp(n_c2);
disp(n_fg2);
