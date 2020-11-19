

haws: haws.o hawsHAWS.o hawsCPUMgr.o hawsGPUMgr.o
	g++ -o haws haws.o

haws.o: haws.cpp
	g++ -c haws.cpp

hawsHAWS.o: hawsHAWS.cpp
	g++ -c hawsHAWS.cpp

hawsCPUMgr.o: hawsCPUMgr.cpp
	g++ -c hawsCPUMgr.cpp

hawsGPUMgr.o: hawsGPUMgr.cpp
	g++ -c hawsGPUMgr.cpp

clean:
	rm *.o haws
