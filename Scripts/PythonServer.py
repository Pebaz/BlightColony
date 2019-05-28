with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((host, port))
    s.listen(1)
    conn, addr = s.accept()
    
    with conn:
        print('Connected to', addr)
        while True:
            conn.sendall(b"Hello World")