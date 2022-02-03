import java.io.File;

class directorySize {
    public static void main(String args[]){
        File file = new File(".");
        File[] files = file.listFiles();
        for (int i = 0; i < files.length; i++) {
            System.out.println("File " + files[i].getName());
        }
    }
}
