#include <ruby.h>

struct RBasicRaw {
    VALUE flags;
    VALUE klass;
};

static VALUE
reclass(VALUE self, VALUE klass) {
  Check_Type(klass, T_CLASS);

  RB_OBJ_WRITE(self, &((struct RBasicRaw *)(self))->klass, klass);

  return self;
}

void
Init_reclass(void) {
  rb_define_method(rb_cObject, "reclass", reclass, 1);
}
