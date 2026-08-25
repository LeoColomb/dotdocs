#import "/packages/logotype/src/lib.typ": logo

#logo()

#assert-panic(() => logo("args"))
