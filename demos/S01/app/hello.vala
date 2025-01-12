// Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)

class Demo.HelloWorld : GLib.Object {

    public static int main(string[] args) { 
        stdout.printf("Hello, World\n"); 

        return 0;
    }
}
