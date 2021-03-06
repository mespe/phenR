/*
Function to calculate heat units according to 
the equations in Bouman et al 2001
 */

void
heat_units(int *n, double *t_min, double *t_max, double *ans,
		   double *t_base, double *t_opt, double *t_high,
		   double *cos_vals)
{
  // Initialize values
  int n_rec = n[0];
  int i, h;
  double d_hu, tmp;
   
 
  // Loop over days
  for(i = 0; i < n_rec; i++) {
	// Reset d_hu each day
	d_hu = 0;
     
	// Loop over hours
	for(h = 0; h < 24; h++) {
	  // Calculate hourly heat units
	  tmp = ((t_max[i] + t_min[i])/2) + ((t_max[i] - t_min[i]) * cos_vals[h]);
	  // If statements for accumulation
	  if(tmp <= t_base[0] || tmp >= t_high[0]){
		d_hu = d_hu + 0;
	  }
       
	  if(tmp > t_base[0] && tmp <= t_opt[0]){
		d_hu = d_hu + (tmp - t_base[0])/24;
	  }
       
	  if(tmp > t_opt[0] && tmp < t_high[0]){
		d_hu = d_hu + ((t_opt[0] - (tmp - t_opt[0]) * (t_opt[0] - t_base[0])/(t_high[0] - t_opt[0]))/24);
	  }
	}
     
	ans[i] = d_hu;
  }
}
