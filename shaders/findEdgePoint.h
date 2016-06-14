/* findEdgePoint function
 * Takes input:
 * planePoint = point on the bevelled edge
 * planeNormal = normal to bevelled edge
 * P = intial point before displacement
 * 
 * Calculates the displacement vector by finding the distance between the 
 * initial point and the plane and multiplying this with the input normal. */

vector findEdgePoint(vector planePoint; vector planeNormal; vector P)
{
	vector normNormal=normalize(planeNormal);
	
	/* Calculate distance from original point to nearest point on the plane */
	vector diff=planePoint-P;
	float distance=normNormal.diff;
	
	/* Return the displacement vector */
	return distance*normNormal;
	
} 
