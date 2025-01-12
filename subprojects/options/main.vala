void main() {
    print("Hello, World!\n");

#if HAVE_A
    print("Feature A is enabled.\n");
#endif

#if HAVE_B
    print("Feature B is enabled.\n");
#endif
}
