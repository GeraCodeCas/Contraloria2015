import java.nio.*;
import java.nio.channels.*;
import java.io.*;

public class SaludosConNIO{
	private String saludo="Bienvenido a java.nio" + System.getProperty("line.separator");
	
	public SaludosConNIO() throws IOException{
		ByteBuffer buffer = ByteBuffer.allocate(23);
		buffer.put(saludo.getBytes());
		buffer.rewind();
		WritableByteChannel canal = Channels.newChannel(System.out);
		canal.write(buffer);
		canal.close();
	}
	
	public static void main(String arg[]) throws IOException{
		new SaludosConNIO();
	}
	
	
}
