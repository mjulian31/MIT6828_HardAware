

haws: hawsTest.o subprocess.o hawsHAWS.o 
	g++ -o haws hawsTest.o subprocess.o hawsHAWS.o -lpthread

hawsTest.o: hawsTest.cpp
	g++ -c hawsTest.cpp  hawsClientRequest.h 

subprocess.o: subprocess.cpp  subprocess.h
	g++ -c subprocess.cpp subprocess.h

hawsHAWS.o: hawsHAWS.cpp hawsHAWS.h hawsUtil.h
	g++ -c hawsHAWS.cpp

#hawsCPUMgr.o: hawsCPUMgr.cpp
#	g++ -c hawsCPUMgr.cpp

#hawsGPUMgr.o: hawsGPUMgr.cpp
#	g++ -c hawsGPUMgr.cpp

clean:
	rm *.o haws
