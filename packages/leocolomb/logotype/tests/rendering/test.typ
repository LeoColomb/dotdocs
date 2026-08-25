#import "../../src/lib.typ": logo

#logo()

#assert-panic(() => logo("args"))
