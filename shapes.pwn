stock CreateDynamicPrisma(modelid, Float:cx, Float:cy, Float:cz, Float:length, Float:width, Float:height, lsegs, wsegs, hsegs, bool:fill)
{	
	if(length == 1.0 || width == 1.0 || height == 1.0 || lsegs == 1 || wsegs == 1 || hsegs == 1) return 0;
	length -= 1.0, width -= 1.0, height -= 1.0, lsegs -=1, wsegs -=1, hsegs -= 1;
	new
		Float:sx = cx - (length / 2.0),
		Float:sy = cy - (width / 2.0),
		Float:sz = cz - (height / 2.0),
		Float:ex = cx + (length / 2.0),
		Float:ey = cy + (width / 2.0),
		Float:ez = cz + (height / 2.0),
		Float:dx = (ex - sx),
		Float:dy = (ey - sy),
		Float:dz = (ez - sz),
		Float:lstep = dx / lsegs,
		Float:wstep = dy / wsegs,
		Float:hstep = dz / hsegs
	;
	for(new Float:x,  Float:mx = lsegs * lstep; x <= mx; x += lstep)  for(new Float:y, Float:my = wsegs * wstep; y <= my; y += wstep)	for(new Float:z,  Float:mz = hsegs * hstep; z <= mz; z += hstep) 
	{
		if(fill || (x == 0.0 || y == 0.0 || z == 0.0 || x == mx || y == my || z == mz)) 
		{
			CreateDynamicObject(modelid, sx + x, sy + y, sz + z, 0.0, 0.0, 0.0);
		}
	}
    return 1;
}
