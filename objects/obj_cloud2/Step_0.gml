index += 0.03;
x += (3.8 + (sin(index))) * 0.45;

if (x > view_xport[0] + view_wport[0] * 3) {
	x = view_xport[0] - view_wport[0];	
}