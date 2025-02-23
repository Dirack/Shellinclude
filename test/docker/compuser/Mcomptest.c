/* 2-D RSF read-write template */
#include <rsf.h>

int main(int argc, char* argv[])
{
        sf_file in, out;
        float* slow;
	int nsv[2];
	float osv[2];
	float dsv[2];
	float *sv;
	int im;

        sf_init (argc, argv);
        in  = sf_input ("in");
        out = sf_output("out");

        if (!sf_histint(in,"n1",nsv)) sf_error("No n1= in input");    
        if (!sf_histfloat(in,"d1",dsv)) sf_error("No d1= in input");
        if (!sf_histfloat(in,"o1",osv)) sf_error("No o1= in input");
        if (!sf_histint(in,"n2",nsv+1)) sf_error("No n2= in input");    
        if (!sf_histfloat(in,"d2",dsv+1)) sf_error("No d2= in input");
        if (!sf_histfloat(in,"o2",osv+1)) sf_error("No o2= in input");

	sv = sf_floatalloc(nsv[0]*nsv[1]);
	sf_floatread(sv,nsv[0]*nsv[1],in);

	slow = sf_floatalloc(nsv[0]*nsv[1]);
	for(im=0;im<nsv[0]*nsv[1];im++)
		slow[im]=1./(sv[im]*sv[im]);

	sf_putint(out,"n1",nsv[0]);
        sf_putint(out,"n2",nsv[1]);
        sf_putfloat(out,"d1",dsv[0]);
        sf_putfloat(out,"d2",dsv[1]);
	sf_putfloat(out,"o1",osv[0]);
	sf_putfloat(out,"o2",osv[1]);
        sf_floatwrite(slow,nsv[0]*nsv[1],out);
}