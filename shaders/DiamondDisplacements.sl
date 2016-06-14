/* DiamondDisplacement displacement shader */
/* Gives box a diamond shape. */
/* Size of corners determined by the edgeBevel input. */
/* Links to findCornerPoint function and findEdgePoint function which
calculate new  points at the corner or edge depending on the input plane
points and plane normal. */


#include "findCornerPoint.h"
#include "findEdgePoint.h"


displacement DiamondDisplacement(float edgeBevel=0.1)
{
    
    point PP = transform ("object", P);
    normal sN = normalize(ntransform("object",N));
    
    float x_start;
    float y_start;
    float z_start;
    float x_end;
    float y_end;
    float z_end;
    
    vector dispVector=vector(0.0,0.0,0.0);
    
    vector dispObj=vtransform("object",dispVector);
    dispObj[0]=0.0;
    dispObj[1]=0.0;
    dispObj[2]=0.0;
    

/* Corner at (0,0,0) */
	if (PP[0]<=edgeBevel && PP[1]<=edgeBevel && PP[2]<=edgeBevel)
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=edgeBevel;
		
		x_end=0.0;
		y_end=0.0;
		z_end=0.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);		
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
		
	}
	
/* Edge along (0,0,k) */	
	if (PP[0]<edgeBevel && PP[1]<edgeBevel && PP[2]>edgeBevel && PP[2]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=edgeBevel;
		x_end=0.0;
		y_end=0.0;
		z_end=0.0;
		
		vector planeNormal=vector(1.0,1.0,0.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Edge along (i,0,0) */	
	if (PP[2]<edgeBevel && PP[1]<edgeBevel && PP[0]>edgeBevel && PP[0]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=edgeBevel;
		x_end=0.0;
		y_end=0.0;
		z_end=0.0;
		
		vector planeNormal=vector(0.0,1.0,1.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];	
	}
	
/* Edge along (0, j, 0) */	
	if (PP[0]<edgeBevel && PP[2]<edgeBevel && PP[1]>edgeBevel && PP[1]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=edgeBevel;
		x_end=0.0;
		y_end=0.0;
		z_end=0.0;
		
		vector planeNormal=vector(1.0,0.0,1.0);
		vector planePoint=vector(x_end,y_start,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Corner at (0,0,1) */
	if (PP[0]<=edgeBevel && PP[1]<=edgeBevel && PP[2]>=(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=(1-edgeBevel);
		
		x_end=0.0;
		y_end=0.0;
		z_end=1.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
		
	}
	
/* Edge along (i,0,1) */	
	if (PP[2]>(1-edgeBevel) && PP[1]<edgeBevel && PP[0]>edgeBevel && PP[0]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=(1-edgeBevel);
		x_end=0.0;
		y_end=0.0;
		z_end=1.0;
		
		vector planeNormal=vector(0.0,1.0,-1.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];	
	}
	
/* Edge along (0, j, 1) */	
	if (PP[0]<edgeBevel && PP[2]>(1-edgeBevel) && PP[1]>edgeBevel && PP[1]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=edgeBevel;
		z_start=(1-edgeBevel);
		x_end=0.0;
		y_end=0.0;
		z_end=1.0;
		
		vector planeNormal=vector(1.0,0.0,-1.0);
		vector planePoint=vector(x_end,y_start,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Corner at (1,0,1) */
	if (PP[0]>=(1-edgeBevel) && PP[1]<=edgeBevel && PP[2]>=(1-edgeBevel))
	{
		x_start=(1-edgeBevel);
		y_start=edgeBevel;
		z_start=(1-edgeBevel);
		
		x_end=1.0;
		y_end=0.0;
		z_end=1.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
	}
	
/* Edge along (1,0,k) */	
	if (PP[0]>(1-edgeBevel) && PP[1]<edgeBevel && PP[2]>edgeBevel && PP[2]<(1-edgeBevel))
	{
		x_start=(1-edgeBevel);
		y_start=edgeBevel;
		z_start=(1-edgeBevel);
		x_end=1.0;
		y_end=0.0;
		z_end=1.0;
		
		vector planeNormal=vector(-1.0,1.0,0.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Edge along (1, j, 1) */	
	if (PP[0]>(1-edgeBevel) && PP[2]>(1-edgeBevel) && PP[1]>edgeBevel && PP[1]<(1-edgeBevel))
	{
		x_start=(1-edgeBevel);
		y_start=edgeBevel;
		z_start=(1-edgeBevel);
		x_end=1.0;
		y_end=0.0;
		z_end=1.0;
		
		vector planeNormal=vector(-1.0,0.0,-1.0);
		vector planePoint=vector(x_end,y_start,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}

/* Corner at (1,0,0) */
	if (PP[0]>=(1-edgeBevel) && PP[1]<=edgeBevel && PP[2]<=edgeBevel)
	{
		x_start=(1-edgeBevel);
		y_start=edgeBevel;
		z_start=edgeBevel;
		
		x_end=1.0;
		y_end=0.0;
		z_end=0.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
	}
	
/* Edge along (1, j, 0) */	
	if (PP[0]>(1-edgeBevel) && PP[2]<edgeBevel && PP[1]>edgeBevel && PP[1]<(1-edgeBevel))
	{
		x_start=(1-edgeBevel);
		y_start=edgeBevel;
		z_start=edgeBevel;
		x_end=1.0;
		y_end=0.0;
		z_end=0.0;
		
		vector planeNormal=vector(-1.0,0.0,1.0);
		vector planePoint=vector(x_end,y_start,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Corner at (0,1,0) */
	if (PP[0]<=edgeBevel && PP[1]>=(1-edgeBevel) && PP[2]<=edgeBevel)
	{
		x_start=edgeBevel;
		y_start=(1-edgeBevel);
		z_start=edgeBevel;
		
		x_end=0.0;
		y_end=1.0;
		z_end=0.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
	}
	
/* Edge along (0,1,k) */	
	if (PP[0]<edgeBevel && PP[1]>(1-edgeBevel) && PP[2]>edgeBevel && PP[2]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=(1-edgeBevel);
		z_start=edgeBevel;
		x_end=0.0;
		y_end=1.0;
		z_end=0.0;
		
		vector planeNormal=vector(1.0,-1.0,0.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Corner at (0,1,1) */
	if (PP[0]<=edgeBevel && PP[1]>=(1-edgeBevel) && PP[2]>=(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=(1-edgeBevel);
		z_start=(1-edgeBevel);
		
		x_end=0.0;
		y_end=1.0;
		z_end=1.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
	}
	
/* Edge along (i,1,1) */	
	if (PP[2]>(1-edgeBevel) && PP[1]>(1-edgeBevel) && PP[0]>edgeBevel && PP[0]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=(1-edgeBevel);
		z_start=(1-edgeBevel);
		x_end=0.0;
		y_end=1.0;
		z_end=1.0;
		
		vector planeNormal=vector(0.0,-1.0,-1.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];	
	}
	
/* Corner at (1,1,1) */
	if (PP[0]>=(1-edgeBevel) && PP[1]>=(1-edgeBevel) && PP[2]>=(1-edgeBevel))
	{
		x_start=(1-edgeBevel);
		y_start=(1-edgeBevel);
		z_start=(1-edgeBevel);
		
		x_end=1.0;
		y_end=1.0;
		z_end=1.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
	}
	
/* Edge along (1,1,k) */	
	if (PP[0]>(1-edgeBevel) && PP[1]>(1-edgeBevel) && PP[2]>edgeBevel && PP[2]<(1-edgeBevel))
	{
		x_start=(1-edgeBevel);
		y_start=(1-edgeBevel);
		z_start=(1-edgeBevel);
		x_end=1.0;
		y_end=1.0;
		z_end=1.0;
		
		vector planeNormal=vector(-1.0,-1.0,0.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];
	}
	
/* Corner at (1,1,0) */
	if (PP[0]>=(1-edgeBevel) && PP[1]>=(1-edgeBevel) && PP[2]<=edgeBevel)
	{
		x_start=(1-edgeBevel);
		y_start=(1-edgeBevel);
		z_start=edgeBevel;
		
		x_end=1.0;
		y_end=1.0;
		z_end=0.0;
	
		vector A=vector(x_end,y_start,z_start);
		vector B=vector(x_start,y_end,z_start);
		vector C=vector(x_start,y_start,z_end);
				
		
		vector p=vector(PP[0],PP[1],PP[2]);
		
		vector Q=findCornerPoint(A,B,C,p);
		
		dispObj[0]=Q[0]-PP[0];
		dispObj[1]=Q[1]-PP[1];
		dispObj[2]=Q[2]-PP[2];		
	}
	
/* Edge along (i,1,0) */	
	if (PP[2]<edgeBevel && PP[1]>(1-edgeBevel) && PP[0]>edgeBevel && PP[0]<(1-edgeBevel))
	{
		x_start=edgeBevel;
		y_start=(1-edgeBevel);
		z_start=edgeBevel;
		x_end=0.0;
		y_end=1.0;
		z_end=0.0;
		
		vector planeNormal=vector(0.0,-1.0,1.0);
		vector planePoint=vector(x_start,y_end,z_start);
		vector p=vector(PP[0],PP[1],PP[2]);
		
		dispVector=findEdgePoint(planePoint,planeNormal,p);
		
		dispObj[0]=dispVector[0];
		dispObj[1]=dispVector[1];
		dispObj[2]=dispVector[2];	
	}
	
	
	
/* Calculate new point and new normal */
	P=transform("object","current",PP+dispObj);
    N = calculatenormal(P);
}
