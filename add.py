with open("word.map.bin", "rb") as f:
	with open("word2.map.bin","wb") as f2:
		while (byte := f.read(1)):
			byte=int.from_bytes(byte,"little")+0x38
			f2.write(byte.to_bytes(1, byteorder='little'))
	