import prman

ri=prman.Ri()

filename="__render"

for i in range(0,244):
	NameofFile="renderRib/Perfume_turnTable_%.3d.rib" % (i)
	
	ri.Begin(NameofFile)
	
	ri.ArchiveRecord(ri.COMMENT, NameofFile)
	
	ri.ArchiveRecord(ri.COMMENT, 'Created by Ina M. Sorensen')
	
	ri.ArchiveRecord(ri.COMMENT, 'Creates image of Chanel perfume bottle')

	ri.ReadArchive("rib/RenderSettings.rib")
	
	ri.Display("images/Perfume_%.3d.tiff" %(i),"file","rgb")
	
	ri.ReadArchive("rib/WorldSettings.rib")
	
	ri.ReadArchive("rib/Lights.rib")
	
	ri.ArchiveRecord(ri.COMMENT, "PerfumeBottle")

	ri.TransformBegin()
	
	ri.Rotate((1.5*i),0,1,0)
	
	ri.ReadArchive("rib/PerfumeBottle.rib")
	
	ri.TransformEnd()
	
	ri.ArchiveRecord(ri.COMMENT, "Environment")
	ri.ReadArchive("rib/Environment.rib")
	
	ri.End()

