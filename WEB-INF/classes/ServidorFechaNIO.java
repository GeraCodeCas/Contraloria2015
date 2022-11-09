import java.net.*;
import java.nio.*;
import java.nio.channels.*;
import java.util.*;

public class ServidorFechaNIO{
	public static final int PUERTO = 9000;
	public static void main(String[] args) throws java.io.IOException{
		ServerSocketChannel canalServidor = ServerSocketChannel.open();
		canalServidor.configureBlocking(false);
		ServerSocket socketServidor = canalServidor.socket();
		InetSocketAddress dirSocket = new InetSocketAddress("localhost",PUERTO);
		socketServidor.bind(dirSocket);
		
		Selector selector = Selector.open();
		
		canalServidor.register(selector,SelectionKey.OP_ACCEPT);
		System.out.println("El servidor esta escuchando por el puerto "+PUERTO);
		ByteBuffer buffer = ByteBuffer.allocate(31);
		
		buffer.clear();
		
		while(true){
			selector.select();
			Set claves = selector.selectedKeys();
			
			Iterator it = claves.iterator();
			
			while (it.hasNext()){
				SelectionKey clave = (SelectionKey) it.next();
				it.remove();
				if (clave.isAcceptable()){
					SocketChannel canalCliente = (SocketChannel) canalServidor.accept();
					canalCliente.configureBlocking(false);
					canalCliente.register(selector,SelectionKey.OP_WRITE);
				}
				if(clave.isWritable()){
					SocketChannel canalCliente = (SocketChannel) clave.channel();
					canalCliente.configureBlocking(false);
					
					String fecha = (new java.util.Date()).toString() + System.getProperty("line.separator");
					buffer.put(fecha.getBytes());
					buffer.flip();
					canalCliente.write(buffer);
					buffer.clear();
					canalCliente.close();
					canalCliente.socket().close();
				}
			}
		}
	}
}
				
					
				
