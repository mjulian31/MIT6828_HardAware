

haws: haws.o hawsHAWS.o hawsCPUMgr.o hawsGPUMgr.o
	g++ -o haws haws.o

haws.o: haws.cpp  hawsHAWS.h
	g++ -c haws.cpp hawsHAWS.h

hawsHAWS.o: hawsHAWS.cpp hawsHAWS.h
	g++ -c hawsHAWS.cpp

hawsCPUMgr.o: hawsCPUMgr.cpp
	g++ -c hawsCPUMgr.cpp

hawsGPUMgr.o: hawsGPUMgr.cpp
	g++ -c hawsGPUMgr.cpp

clean:
	rm *.o haws
