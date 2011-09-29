
/*
//:Create class for load buffers to Server


MyBuffers.seals;
MyBuffers.swallows;
MyBuffers.conet;

MyBuffers.osmoFull;


//: -----
*/

MyBuffers {
	*seals	{
		BufferResource loadPaths: UserPath("Extensions/projects/ofSpectrograph/scCode/buffer-lists/seals-buffer-list.txt").load;
	}
	
	*conet	{
		BufferResource loadPaths: UserPath("Extensions/projects/ofSpectrograph/scCode/buffer-lists/conet-buffer-list.txt").load;
	}
		
	*swallows {
		BufferResource loadPaths: UserPath("Extensions/projects/ofSpectrograph/scCode/buffer-lists/swallows-buffer-list.txt").load;
	}

}

