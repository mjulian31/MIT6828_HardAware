

haws: hawsTest.o hawsTestSocket.o subprocess.o hawsHAWS.o socket.o
	g++ -o haws hawsTest.o hawsTestSocket.o subprocess.o hawsHAWS.o socket.o -lpthread

hawsTest.o: hawsTest.cpp
	g++ -c hawsTest.cpp  hawsClientRequest.h 

hawsTestSocket.o: hawsTestSocket.cpp hawsTestSocket.cpp
	g++ -c hawsTestSocket.cpp  hawsClientRequest.h  hawsTestSocket.h

subprocess.o: subprocess.cpp  subprocess.h
	g++ -c subprocess.cpp subprocess.h

hawsHAWS.o: hawsHAWS.cpp hawsHAWS.h hawsUtil.h
	g++ -c hawsHAWS.cpp

socket.o: socket.cpp socket.h
	g++ -c socket.cpp socket.h

#hawsCPUMgr.o: hawsCPUMgr.cpp
#	g++ -c hawsCPUMgr.cpp

#hawsGPUMgr.o: hawsGPUMgr.cpp
#	g++ -c hawsGPUMgr.cpp

clean:
	rm *.o haws
