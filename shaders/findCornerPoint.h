/* findCornerPoint function
 * Takes input:
 * A, B and C =  corners of the triangle in object space
 * p = the initial point before displacement
 * 
 * Calculates the displacement vector by projecting p to the plane of the triangle
 * Checks whether the projection is outside triangle and, if so, clamps it 
 * to the nearest edge or corner. Calculates using Barycentric coordinates
 * 
 * 
 * Code taken from:
 * Christer Ericson, "Real-Time Collision Detection", Elsevier Inc. [2005]
 * Chapter 5.1: Closest-point Computations, p. 141-142
*/
 
vector findCornerPoint(vector A; vector B; vector C; vector p)
{
		vector AB=B-A;
		vector AC=C-A;
		vector AP=p-A;
		
		float d1=AB.AP;
		float d2=AC.AP;
		
		/* If point in the voronoi region outside corner A, return A */
		if(d1<=0.0 && d2<=0.0)
		{
			return A;
		}
		
		vector BP=p-B;
		float d3=AB.BP;
		float d4=AC.BP;
		
		/* If point in voronoi region outside corner B, return B */	
		if (d3>=0 && d4<=d3)
		{
			return B;
		}
		 
		float vc=(d1*d4)-(d3*d2);
		
		/* If point in region outside edge AB, calculate projected */
		/* point based on Barycentric coordinates (1-v,v,0) */
		if (vc<=0 && d1>=0 && d3<=0)
		{
			float v=d1/(d1-d3);
			return (A+(v*AB));
		}
		
		vector CP=p-C;
		float d5=AB.CP;
		float d6=AC.CP;
		
		/* If point in voronoi region outside corner C, return C */
		if (d6>=0 && d5<=d6)
		{
			return C;
		}
		
		float vb=(d5*d2)-(d1*d6);
		
		/* If point in region outside edge AC, calculate projected */
		/* point based on Barycentric coordinates (1-w,0,w) */
		if (vb<=0 && d2>=0 && d6<=0)
		{
			float w=d2/(d2-d6);
			return (A+(w*AC));
		}
		
		float va=(d3*d6)-(d5*d4);
		
		/* If point in region outside edge BC, calculate projected */
		/* point based on Barycentric coordinates (0,1-w,w) */				
		if (va<=0 && (d4-d3)>=0 && (d5-d6)>=0)
		{
			float w=(d4-d3)/((d4-d3)+(d5-d6));
			return (B+(w*(C-B)));
		}
		
		/* If not in any of these regions, then point projected inside */
		/* triangle, calculate point based on Barycentric coordinates (1-v-w,v,w) */
		
		float denom=1.0/(va+vb+vc);
		float v=vb*denom;
		float w=vc*denom;
		
		return (A+(v*AB)+(w*AC));

} 
    
  
