from subprocess import run

def get_pass(entry):
    return run(["pass", entry], capture_output=True).stdout.decode().strip()

if __name__ == "__main__":
    print(get_pass("mr.meowking@anche.no"))
