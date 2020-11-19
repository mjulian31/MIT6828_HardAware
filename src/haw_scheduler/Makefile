

haws: hawsMain.o subprocess.o hawsHAWS.o hawsCPUMgr.o hawsGPUMgr.o
	g++ -o haws hawsMain.o subprocess.o hawsHAWS.o hawsCPUMgr.o hawsGPUMgr.o

hawsMain.o: hawsMain.cpp
	g++ -c hawsMain.cpp  hawsClientRequest.h

subprocess.o: subprocess.cpp  subprocess.h
	g++ -c subprocess.cpp subprocess.h

hawsHAWS.o: hawsHAWS.cpp hawsHAWS.h
	g++ -c hawsHAWS.cpp

hawsCPUMgr.o: hawsCPUMgr.cpp
	g++ -c hawsCPUMgr.cpp

hawsGPUMgr.o: hawsGPUMgr.cpp
	g++ -c hawsGPUMgr.cpp

clean:
	rm *.o haws
