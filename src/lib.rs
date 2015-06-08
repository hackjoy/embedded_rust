use std::thread;

// prevent change of function name in
// compiled output
#[no_mangle]

// pub allows function to be called outside module
// extern allows function to be called from C
pub extern fn process () {
    let handles: Vec<_> = (0..10).map(|_| {
        thread::spawn(|| {
            let mut _x = 0;
            for _ in (0..5_000_001) {
                _x += 1
            }
        })
    }).collect();

    for h in handles {
        h.join().ok().expect("Could not join a thread!");
    }
}
