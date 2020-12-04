

haws: hawsTest.o hawsTestSocket.o subprocess.o hawsHAWS.o socket.o hawsSocket.o
	g++ -o haws hawsTest.o hawsTestSocket.o subprocess.o hawsHAWS.o socket.o hawsSocket.o -lpthread

hawsTest.o: hawsTest.cpp hawsTest.h socket.h
	g++ -c hawsTest.cpp  hawsClientRequest.h hawsTest.h socket.h

hawsTestSocket.o: hawsTestSocket.cpp 
	g++ -c hawsTestSocket.cpp  hawsClientRequest.h

subprocess.o: subprocess.cpp  subprocess.h
	g++ -c subprocess.cpp subprocess.h

hawsHAWS.o: hawsHAWS.cpp hawsHAWS.h hawsUtil.h hawsSocket.h
	g++ -c hawsHAWS.cpp hawsHAWS.h hawsUtil.h hawsSocket.h

socket.o: socket.cpp socket.h
	g++ -c socket.cpp socket.h

hawsSocket.o: hawsSocket.cpp
	g++ -c hawsSocket.cpp



#hawsCPUMgr.o: hawsCPUMgr.cpp
#	g++ -c hawsCPUMgr.cpp

#hawsGPUMgr.o: hawsGPUMgr.cpp
#	g++ -c hawsGPUMgr.cpp

clean:
	rm *.o haws
