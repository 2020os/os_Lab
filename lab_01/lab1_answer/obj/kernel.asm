
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	e8 74 02 00 00       	call   100280 <__x86.get_pc_thunk.bx>
  10000c:	81 c3 44 e9 00 00    	add    $0xe944,%ebx
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100012:	c7 c0 c0 fd 10 00    	mov    $0x10fdc0,%eax
  100018:	89 c2                	mov    %eax,%edx
  10001a:	c7 c0 50 e9 10 00    	mov    $0x10e950,%eax
  100020:	29 c2                	sub    %eax,%edx
  100022:	89 d0                	mov    %edx,%eax
  100024:	83 ec 04             	sub    $0x4,%esp
  100027:	50                   	push   %eax
  100028:	6a 00                	push   $0x0
  10002a:	c7 c0 50 e9 10 00    	mov    $0x10e950,%eax
  100030:	50                   	push   %eax
  100031:	e8 1e 2f 00 00       	call   102f54 <memset>
  100036:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100039:	e8 fa 17 00 00       	call   101838 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10003e:	8d 83 30 4e ff ff    	lea    -0xb1d0(%ebx),%eax
  100044:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100047:	83 ec 08             	sub    $0x8,%esp
  10004a:	ff 75 f4             	pushl  -0xc(%ebp)
  10004d:	8d 83 4c 4e ff ff    	lea    -0xb1b4(%ebx),%eax
  100053:	50                   	push   %eax
  100054:	e8 9a 02 00 00       	call   1002f3 <cprintf>
  100059:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  10005c:	e8 ba 09 00 00       	call   100a1b <print_kerninfo>

    grade_backtrace();
  100061:	e8 98 00 00 00       	call   1000fe <grade_backtrace>

    pmm_init();                 // init physical memory management
  100066:	e8 49 2b 00 00       	call   102bb4 <pmm_init>

    pic_init();                 // init interrupt controller
  10006b:	e8 57 19 00 00       	call   1019c7 <pic_init>
    idt_init();                 // init interrupt descriptor table
  100070:	e8 e9 1a 00 00       	call   101b5e <idt_init>

    clock_init();               // init clock interrupt
  100075:	e8 ba 0e 00 00       	call   100f34 <clock_init>
    intr_enable();              // enable irq interrupt
  10007a:	e8 90 1a 00 00       	call   101b0f <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10007f:	eb fe                	jmp    10007f <kern_init+0x7f>

00100081 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100081:	55                   	push   %ebp
  100082:	89 e5                	mov    %esp,%ebp
  100084:	53                   	push   %ebx
  100085:	83 ec 04             	sub    $0x4,%esp
  100088:	e8 ef 01 00 00       	call   10027c <__x86.get_pc_thunk.ax>
  10008d:	05 c3 e8 00 00       	add    $0xe8c3,%eax
    mon_backtrace(0, NULL, NULL);
  100092:	83 ec 04             	sub    $0x4,%esp
  100095:	6a 00                	push   $0x0
  100097:	6a 00                	push   $0x0
  100099:	6a 00                	push   $0x0
  10009b:	89 c3                	mov    %eax,%ebx
  10009d:	e8 6f 0e 00 00       	call   100f11 <mon_backtrace>
  1000a2:	83 c4 10             	add    $0x10,%esp
}
  1000a5:	90                   	nop
  1000a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a9:	c9                   	leave  
  1000aa:	c3                   	ret    

001000ab <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  1000ab:	55                   	push   %ebp
  1000ac:	89 e5                	mov    %esp,%ebp
  1000ae:	53                   	push   %ebx
  1000af:	83 ec 04             	sub    $0x4,%esp
  1000b2:	e8 c5 01 00 00       	call   10027c <__x86.get_pc_thunk.ax>
  1000b7:	05 99 e8 00 00       	add    $0xe899,%eax
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000bc:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000c2:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000c8:	51                   	push   %ecx
  1000c9:	52                   	push   %edx
  1000ca:	53                   	push   %ebx
  1000cb:	50                   	push   %eax
  1000cc:	e8 b0 ff ff ff       	call   100081 <grade_backtrace2>
  1000d1:	83 c4 10             	add    $0x10,%esp
}
  1000d4:	90                   	nop
  1000d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000d8:	c9                   	leave  
  1000d9:	c3                   	ret    

001000da <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000da:	55                   	push   %ebp
  1000db:	89 e5                	mov    %esp,%ebp
  1000dd:	83 ec 08             	sub    $0x8,%esp
  1000e0:	e8 97 01 00 00       	call   10027c <__x86.get_pc_thunk.ax>
  1000e5:	05 6b e8 00 00       	add    $0xe86b,%eax
    grade_backtrace1(arg0, arg2);
  1000ea:	83 ec 08             	sub    $0x8,%esp
  1000ed:	ff 75 10             	pushl  0x10(%ebp)
  1000f0:	ff 75 08             	pushl  0x8(%ebp)
  1000f3:	e8 b3 ff ff ff       	call   1000ab <grade_backtrace1>
  1000f8:	83 c4 10             	add    $0x10,%esp
}
  1000fb:	90                   	nop
  1000fc:	c9                   	leave  
  1000fd:	c3                   	ret    

001000fe <grade_backtrace>:

void
grade_backtrace(void) {
  1000fe:	55                   	push   %ebp
  1000ff:	89 e5                	mov    %esp,%ebp
  100101:	83 ec 08             	sub    $0x8,%esp
  100104:	e8 73 01 00 00       	call   10027c <__x86.get_pc_thunk.ax>
  100109:	05 47 e8 00 00       	add    $0xe847,%eax
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  10010e:	8d 80 b0 16 ff ff    	lea    -0xe950(%eax),%eax
  100114:	83 ec 04             	sub    $0x4,%esp
  100117:	68 00 00 ff ff       	push   $0xffff0000
  10011c:	50                   	push   %eax
  10011d:	6a 00                	push   $0x0
  10011f:	e8 b6 ff ff ff       	call   1000da <grade_backtrace0>
  100124:	83 c4 10             	add    $0x10,%esp
}
  100127:	90                   	nop
  100128:	c9                   	leave  
  100129:	c3                   	ret    

0010012a <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  10012a:	55                   	push   %ebp
  10012b:	89 e5                	mov    %esp,%ebp
  10012d:	53                   	push   %ebx
  10012e:	83 ec 14             	sub    $0x14,%esp
  100131:	e8 4a 01 00 00       	call   100280 <__x86.get_pc_thunk.bx>
  100136:	81 c3 1a e8 00 00    	add    $0xe81a,%ebx
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10013c:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10013f:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100142:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100145:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100148:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10014c:	0f b7 c0             	movzwl %ax,%eax
  10014f:	83 e0 03             	and    $0x3,%eax
  100152:	89 c2                	mov    %eax,%edx
  100154:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  10015a:	83 ec 04             	sub    $0x4,%esp
  10015d:	52                   	push   %edx
  10015e:	50                   	push   %eax
  10015f:	8d 83 51 4e ff ff    	lea    -0xb1af(%ebx),%eax
  100165:	50                   	push   %eax
  100166:	e8 88 01 00 00       	call   1002f3 <cprintf>
  10016b:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10016e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100172:	0f b7 d0             	movzwl %ax,%edx
  100175:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  10017b:	83 ec 04             	sub    $0x4,%esp
  10017e:	52                   	push   %edx
  10017f:	50                   	push   %eax
  100180:	8d 83 5f 4e ff ff    	lea    -0xb1a1(%ebx),%eax
  100186:	50                   	push   %eax
  100187:	e8 67 01 00 00       	call   1002f3 <cprintf>
  10018c:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  10018f:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100193:	0f b7 d0             	movzwl %ax,%edx
  100196:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  10019c:	83 ec 04             	sub    $0x4,%esp
  10019f:	52                   	push   %edx
  1001a0:	50                   	push   %eax
  1001a1:	8d 83 6d 4e ff ff    	lea    -0xb193(%ebx),%eax
  1001a7:	50                   	push   %eax
  1001a8:	e8 46 01 00 00       	call   1002f3 <cprintf>
  1001ad:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  1001b0:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1001b4:	0f b7 d0             	movzwl %ax,%edx
  1001b7:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001bd:	83 ec 04             	sub    $0x4,%esp
  1001c0:	52                   	push   %edx
  1001c1:	50                   	push   %eax
  1001c2:	8d 83 7b 4e ff ff    	lea    -0xb185(%ebx),%eax
  1001c8:	50                   	push   %eax
  1001c9:	e8 25 01 00 00       	call   1002f3 <cprintf>
  1001ce:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  1001d1:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001d5:	0f b7 d0             	movzwl %ax,%edx
  1001d8:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001de:	83 ec 04             	sub    $0x4,%esp
  1001e1:	52                   	push   %edx
  1001e2:	50                   	push   %eax
  1001e3:	8d 83 89 4e ff ff    	lea    -0xb177(%ebx),%eax
  1001e9:	50                   	push   %eax
  1001ea:	e8 04 01 00 00       	call   1002f3 <cprintf>
  1001ef:	83 c4 10             	add    $0x10,%esp
    round ++;
  1001f2:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001f8:	83 c0 01             	add    $0x1,%eax
  1001fb:	89 83 70 01 00 00    	mov    %eax,0x170(%ebx)
}
  100201:	90                   	nop
  100202:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100205:	c9                   	leave  
  100206:	c3                   	ret    

00100207 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  100207:	55                   	push   %ebp
  100208:	89 e5                	mov    %esp,%ebp
  10020a:	e8 6d 00 00 00       	call   10027c <__x86.get_pc_thunk.ax>
  10020f:	05 41 e7 00 00       	add    $0xe741,%eax
    //LAB1 CHALLENGE 1 : TODO
}
  100214:	90                   	nop
  100215:	5d                   	pop    %ebp
  100216:	c3                   	ret    

00100217 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  100217:	55                   	push   %ebp
  100218:	89 e5                	mov    %esp,%ebp
  10021a:	e8 5d 00 00 00       	call   10027c <__x86.get_pc_thunk.ax>
  10021f:	05 31 e7 00 00       	add    $0xe731,%eax
    //LAB1 CHALLENGE 1 :  TODO
}
  100224:	90                   	nop
  100225:	5d                   	pop    %ebp
  100226:	c3                   	ret    

00100227 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  100227:	55                   	push   %ebp
  100228:	89 e5                	mov    %esp,%ebp
  10022a:	53                   	push   %ebx
  10022b:	83 ec 04             	sub    $0x4,%esp
  10022e:	e8 4d 00 00 00       	call   100280 <__x86.get_pc_thunk.bx>
  100233:	81 c3 1d e7 00 00    	add    $0xe71d,%ebx
    lab1_print_cur_status();
  100239:	e8 ec fe ff ff       	call   10012a <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  10023e:	83 ec 0c             	sub    $0xc,%esp
  100241:	8d 83 98 4e ff ff    	lea    -0xb168(%ebx),%eax
  100247:	50                   	push   %eax
  100248:	e8 a6 00 00 00       	call   1002f3 <cprintf>
  10024d:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  100250:	e8 b2 ff ff ff       	call   100207 <lab1_switch_to_user>
    lab1_print_cur_status();
  100255:	e8 d0 fe ff ff       	call   10012a <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10025a:	83 ec 0c             	sub    $0xc,%esp
  10025d:	8d 83 b8 4e ff ff    	lea    -0xb148(%ebx),%eax
  100263:	50                   	push   %eax
  100264:	e8 8a 00 00 00       	call   1002f3 <cprintf>
  100269:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  10026c:	e8 a6 ff ff ff       	call   100217 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100271:	e8 b4 fe ff ff       	call   10012a <lab1_print_cur_status>
}
  100276:	90                   	nop
  100277:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10027a:	c9                   	leave  
  10027b:	c3                   	ret    

0010027c <__x86.get_pc_thunk.ax>:
  10027c:	8b 04 24             	mov    (%esp),%eax
  10027f:	c3                   	ret    

00100280 <__x86.get_pc_thunk.bx>:
  100280:	8b 1c 24             	mov    (%esp),%ebx
  100283:	c3                   	ret    

00100284 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100284:	55                   	push   %ebp
  100285:	89 e5                	mov    %esp,%ebp
  100287:	53                   	push   %ebx
  100288:	83 ec 04             	sub    $0x4,%esp
  10028b:	e8 ec ff ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100290:	05 c0 e6 00 00       	add    $0xe6c0,%eax
    cons_putc(c);
  100295:	83 ec 0c             	sub    $0xc,%esp
  100298:	ff 75 08             	pushl  0x8(%ebp)
  10029b:	89 c3                	mov    %eax,%ebx
  10029d:	e8 d9 15 00 00       	call   10187b <cons_putc>
  1002a2:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1002a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002a8:	8b 00                	mov    (%eax),%eax
  1002aa:	8d 50 01             	lea    0x1(%eax),%edx
  1002ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002b0:	89 10                	mov    %edx,(%eax)
}
  1002b2:	90                   	nop
  1002b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002b6:	c9                   	leave  
  1002b7:	c3                   	ret    

001002b8 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002b8:	55                   	push   %ebp
  1002b9:	89 e5                	mov    %esp,%ebp
  1002bb:	53                   	push   %ebx
  1002bc:	83 ec 14             	sub    $0x14,%esp
  1002bf:	e8 b8 ff ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1002c4:	05 8c e6 00 00       	add    $0xe68c,%eax
    int cnt = 0;
  1002c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002d0:	ff 75 0c             	pushl  0xc(%ebp)
  1002d3:	ff 75 08             	pushl  0x8(%ebp)
  1002d6:	8d 55 f4             	lea    -0xc(%ebp),%edx
  1002d9:	52                   	push   %edx
  1002da:	8d 90 34 19 ff ff    	lea    -0xe6cc(%eax),%edx
  1002e0:	52                   	push   %edx
  1002e1:	89 c3                	mov    %eax,%ebx
  1002e3:	e8 fa 2f 00 00       	call   1032e2 <vprintfmt>
  1002e8:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002f1:	c9                   	leave  
  1002f2:	c3                   	ret    

001002f3 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  1002f3:	55                   	push   %ebp
  1002f4:	89 e5                	mov    %esp,%ebp
  1002f6:	83 ec 18             	sub    $0x18,%esp
  1002f9:	e8 7e ff ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1002fe:	05 52 e6 00 00       	add    $0xe652,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100303:	8d 45 0c             	lea    0xc(%ebp),%eax
  100306:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100309:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10030c:	83 ec 08             	sub    $0x8,%esp
  10030f:	50                   	push   %eax
  100310:	ff 75 08             	pushl  0x8(%ebp)
  100313:	e8 a0 ff ff ff       	call   1002b8 <vcprintf>
  100318:	83 c4 10             	add    $0x10,%esp
  10031b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10031e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100321:	c9                   	leave  
  100322:	c3                   	ret    

00100323 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100323:	55                   	push   %ebp
  100324:	89 e5                	mov    %esp,%ebp
  100326:	53                   	push   %ebx
  100327:	83 ec 04             	sub    $0x4,%esp
  10032a:	e8 4d ff ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  10032f:	05 21 e6 00 00       	add    $0xe621,%eax
    cons_putc(c);
  100334:	83 ec 0c             	sub    $0xc,%esp
  100337:	ff 75 08             	pushl  0x8(%ebp)
  10033a:	89 c3                	mov    %eax,%ebx
  10033c:	e8 3a 15 00 00       	call   10187b <cons_putc>
  100341:	83 c4 10             	add    $0x10,%esp
}
  100344:	90                   	nop
  100345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100348:	c9                   	leave  
  100349:	c3                   	ret    

0010034a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034a:	55                   	push   %ebp
  10034b:	89 e5                	mov    %esp,%ebp
  10034d:	83 ec 18             	sub    $0x18,%esp
  100350:	e8 27 ff ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100355:	05 fb e5 00 00       	add    $0xe5fb,%eax
    int cnt = 0;
  10035a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100361:	eb 14                	jmp    100377 <cputs+0x2d>
        cputch(c, &cnt);
  100363:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100367:	83 ec 08             	sub    $0x8,%esp
  10036a:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10036d:	52                   	push   %edx
  10036e:	50                   	push   %eax
  10036f:	e8 10 ff ff ff       	call   100284 <cputch>
  100374:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  100377:	8b 45 08             	mov    0x8(%ebp),%eax
  10037a:	8d 50 01             	lea    0x1(%eax),%edx
  10037d:	89 55 08             	mov    %edx,0x8(%ebp)
  100380:	0f b6 00             	movzbl (%eax),%eax
  100383:	88 45 f7             	mov    %al,-0x9(%ebp)
  100386:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10038a:	75 d7                	jne    100363 <cputs+0x19>
    }
    cputch('\n', &cnt);
  10038c:	83 ec 08             	sub    $0x8,%esp
  10038f:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100392:	50                   	push   %eax
  100393:	6a 0a                	push   $0xa
  100395:	e8 ea fe ff ff       	call   100284 <cputch>
  10039a:	83 c4 10             	add    $0x10,%esp
    return cnt;
  10039d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003a0:	c9                   	leave  
  1003a1:	c3                   	ret    

001003a2 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003a2:	55                   	push   %ebp
  1003a3:	89 e5                	mov    %esp,%ebp
  1003a5:	53                   	push   %ebx
  1003a6:	83 ec 14             	sub    $0x14,%esp
  1003a9:	e8 d2 fe ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  1003ae:	81 c3 a2 e5 00 00    	add    $0xe5a2,%ebx
    int c;
    while ((c = cons_getc()) == 0)
  1003b4:	e8 fc 14 00 00       	call   1018b5 <cons_getc>
  1003b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003c0:	74 f2                	je     1003b4 <getchar+0x12>
        /* do nothing */;
    return c;
  1003c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003c5:	83 c4 14             	add    $0x14,%esp
  1003c8:	5b                   	pop    %ebx
  1003c9:	5d                   	pop    %ebp
  1003ca:	c3                   	ret    

001003cb <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1003cb:	55                   	push   %ebp
  1003cc:	89 e5                	mov    %esp,%ebp
  1003ce:	53                   	push   %ebx
  1003cf:	83 ec 14             	sub    $0x14,%esp
  1003d2:	e8 a9 fe ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  1003d7:	81 c3 79 e5 00 00    	add    $0xe579,%ebx
    if (prompt != NULL) {
  1003dd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1003e1:	74 15                	je     1003f8 <readline+0x2d>
        cprintf("%s", prompt);
  1003e3:	83 ec 08             	sub    $0x8,%esp
  1003e6:	ff 75 08             	pushl  0x8(%ebp)
  1003e9:	8d 83 d7 4e ff ff    	lea    -0xb129(%ebx),%eax
  1003ef:	50                   	push   %eax
  1003f0:	e8 fe fe ff ff       	call   1002f3 <cprintf>
  1003f5:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  1003f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  1003ff:	e8 9e ff ff ff       	call   1003a2 <getchar>
  100404:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100407:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10040b:	79 0a                	jns    100417 <readline+0x4c>
            return NULL;
  10040d:	b8 00 00 00 00       	mov    $0x0,%eax
  100412:	e9 87 00 00 00       	jmp    10049e <readline+0xd3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100417:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10041b:	7e 2c                	jle    100449 <readline+0x7e>
  10041d:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100424:	7f 23                	jg     100449 <readline+0x7e>
            cputchar(c);
  100426:	83 ec 0c             	sub    $0xc,%esp
  100429:	ff 75 f0             	pushl  -0x10(%ebp)
  10042c:	e8 f2 fe ff ff       	call   100323 <cputchar>
  100431:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100434:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100437:	8d 50 01             	lea    0x1(%eax),%edx
  10043a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10043d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100440:	88 94 03 90 01 00 00 	mov    %dl,0x190(%ebx,%eax,1)
  100447:	eb 50                	jmp    100499 <readline+0xce>
        }
        else if (c == '\b' && i > 0) {
  100449:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10044d:	75 1a                	jne    100469 <readline+0x9e>
  10044f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100453:	7e 14                	jle    100469 <readline+0x9e>
            cputchar(c);
  100455:	83 ec 0c             	sub    $0xc,%esp
  100458:	ff 75 f0             	pushl  -0x10(%ebp)
  10045b:	e8 c3 fe ff ff       	call   100323 <cputchar>
  100460:	83 c4 10             	add    $0x10,%esp
            i --;
  100463:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100467:	eb 30                	jmp    100499 <readline+0xce>
        }
        else if (c == '\n' || c == '\r') {
  100469:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10046d:	74 06                	je     100475 <readline+0xaa>
  10046f:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100473:	75 8a                	jne    1003ff <readline+0x34>
            cputchar(c);
  100475:	83 ec 0c             	sub    $0xc,%esp
  100478:	ff 75 f0             	pushl  -0x10(%ebp)
  10047b:	e8 a3 fe ff ff       	call   100323 <cputchar>
  100480:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  100483:	8d 93 90 01 00 00    	lea    0x190(%ebx),%edx
  100489:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10048c:	01 d0                	add    %edx,%eax
  10048e:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  100491:	8d 83 90 01 00 00    	lea    0x190(%ebx),%eax
  100497:	eb 05                	jmp    10049e <readline+0xd3>
        c = getchar();
  100499:	e9 61 ff ff ff       	jmp    1003ff <readline+0x34>
        }
    }
}
  10049e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004a1:	c9                   	leave  
  1004a2:	c3                   	ret    

001004a3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1004a3:	55                   	push   %ebp
  1004a4:	89 e5                	mov    %esp,%ebp
  1004a6:	53                   	push   %ebx
  1004a7:	83 ec 14             	sub    $0x14,%esp
  1004aa:	e8 d1 fd ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  1004af:	81 c3 a1 e4 00 00    	add    $0xe4a1,%ebx
    if (is_panic) {
  1004b5:	8b 83 90 05 00 00    	mov    0x590(%ebx),%eax
  1004bb:	85 c0                	test   %eax,%eax
  1004bd:	75 4e                	jne    10050d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1004bf:	c7 83 90 05 00 00 01 	movl   $0x1,0x590(%ebx)
  1004c6:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1004c9:	8d 45 14             	lea    0x14(%ebp),%eax
  1004cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1004cf:	83 ec 04             	sub    $0x4,%esp
  1004d2:	ff 75 0c             	pushl  0xc(%ebp)
  1004d5:	ff 75 08             	pushl  0x8(%ebp)
  1004d8:	8d 83 da 4e ff ff    	lea    -0xb126(%ebx),%eax
  1004de:	50                   	push   %eax
  1004df:	e8 0f fe ff ff       	call   1002f3 <cprintf>
  1004e4:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1004e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004ea:	83 ec 08             	sub    $0x8,%esp
  1004ed:	50                   	push   %eax
  1004ee:	ff 75 10             	pushl  0x10(%ebp)
  1004f1:	e8 c2 fd ff ff       	call   1002b8 <vcprintf>
  1004f6:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1004f9:	83 ec 0c             	sub    $0xc,%esp
  1004fc:	8d 83 f6 4e ff ff    	lea    -0xb10a(%ebx),%eax
  100502:	50                   	push   %eax
  100503:	e8 eb fd ff ff       	call   1002f3 <cprintf>
  100508:	83 c4 10             	add    $0x10,%esp
  10050b:	eb 01                	jmp    10050e <__panic+0x6b>
        goto panic_dead;
  10050d:	90                   	nop
    va_end(ap);

panic_dead:
    intr_disable();
  10050e:	e8 0d 16 00 00       	call   101b20 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100513:	83 ec 0c             	sub    $0xc,%esp
  100516:	6a 00                	push   $0x0
  100518:	e8 da 08 00 00       	call   100df7 <kmonitor>
  10051d:	83 c4 10             	add    $0x10,%esp
  100520:	eb f1                	jmp    100513 <__panic+0x70>

00100522 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100522:	55                   	push   %ebp
  100523:	89 e5                	mov    %esp,%ebp
  100525:	53                   	push   %ebx
  100526:	83 ec 14             	sub    $0x14,%esp
  100529:	e8 52 fd ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  10052e:	81 c3 22 e4 00 00    	add    $0xe422,%ebx
    va_list ap;
    va_start(ap, fmt);
  100534:	8d 45 14             	lea    0x14(%ebp),%eax
  100537:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10053a:	83 ec 04             	sub    $0x4,%esp
  10053d:	ff 75 0c             	pushl  0xc(%ebp)
  100540:	ff 75 08             	pushl  0x8(%ebp)
  100543:	8d 83 f8 4e ff ff    	lea    -0xb108(%ebx),%eax
  100549:	50                   	push   %eax
  10054a:	e8 a4 fd ff ff       	call   1002f3 <cprintf>
  10054f:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100552:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100555:	83 ec 08             	sub    $0x8,%esp
  100558:	50                   	push   %eax
  100559:	ff 75 10             	pushl  0x10(%ebp)
  10055c:	e8 57 fd ff ff       	call   1002b8 <vcprintf>
  100561:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100564:	83 ec 0c             	sub    $0xc,%esp
  100567:	8d 83 f6 4e ff ff    	lea    -0xb10a(%ebx),%eax
  10056d:	50                   	push   %eax
  10056e:	e8 80 fd ff ff       	call   1002f3 <cprintf>
  100573:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100576:	90                   	nop
  100577:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10057a:	c9                   	leave  
  10057b:	c3                   	ret    

0010057c <is_kernel_panic>:

bool
is_kernel_panic(void) {
  10057c:	55                   	push   %ebp
  10057d:	89 e5                	mov    %esp,%ebp
  10057f:	e8 f8 fc ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100584:	05 cc e3 00 00       	add    $0xe3cc,%eax
    return is_panic;
  100589:	8b 80 90 05 00 00    	mov    0x590(%eax),%eax
}
  10058f:	5d                   	pop    %ebp
  100590:	c3                   	ret    

00100591 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100591:	55                   	push   %ebp
  100592:	89 e5                	mov    %esp,%ebp
  100594:	83 ec 20             	sub    $0x20,%esp
  100597:	e8 e0 fc ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  10059c:	05 b4 e3 00 00       	add    $0xe3b4,%eax
    int l = *region_left, r = *region_right, any_matches = 0;
  1005a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005a4:	8b 00                	mov    (%eax),%eax
  1005a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1005a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1005ac:	8b 00                	mov    (%eax),%eax
  1005ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1005b8:	e9 d2 00 00 00       	jmp    10068f <stab_binsearch+0xfe>
        int true_m = (l + r) / 2, m = true_m;
  1005bd:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1005c3:	01 d0                	add    %edx,%eax
  1005c5:	89 c2                	mov    %eax,%edx
  1005c7:	c1 ea 1f             	shr    $0x1f,%edx
  1005ca:	01 d0                	add    %edx,%eax
  1005cc:	d1 f8                	sar    %eax
  1005ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1005d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1005d4:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1005d7:	eb 04                	jmp    1005dd <stab_binsearch+0x4c>
            m --;
  1005d9:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1005dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005e0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005e3:	7c 1f                	jl     100604 <stab_binsearch+0x73>
  1005e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005e8:	89 d0                	mov    %edx,%eax
  1005ea:	01 c0                	add    %eax,%eax
  1005ec:	01 d0                	add    %edx,%eax
  1005ee:	c1 e0 02             	shl    $0x2,%eax
  1005f1:	89 c2                	mov    %eax,%edx
  1005f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f6:	01 d0                	add    %edx,%eax
  1005f8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005fc:	0f b6 c0             	movzbl %al,%eax
  1005ff:	39 45 14             	cmp    %eax,0x14(%ebp)
  100602:	75 d5                	jne    1005d9 <stab_binsearch+0x48>
        }
        if (m < l) {    // no match in [l, m]
  100604:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100607:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10060a:	7d 0b                	jge    100617 <stab_binsearch+0x86>
            l = true_m + 1;
  10060c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10060f:	83 c0 01             	add    $0x1,%eax
  100612:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100615:	eb 78                	jmp    10068f <stab_binsearch+0xfe>
        }

        // actual binary search
        any_matches = 1;
  100617:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10061e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100621:	89 d0                	mov    %edx,%eax
  100623:	01 c0                	add    %eax,%eax
  100625:	01 d0                	add    %edx,%eax
  100627:	c1 e0 02             	shl    $0x2,%eax
  10062a:	89 c2                	mov    %eax,%edx
  10062c:	8b 45 08             	mov    0x8(%ebp),%eax
  10062f:	01 d0                	add    %edx,%eax
  100631:	8b 40 08             	mov    0x8(%eax),%eax
  100634:	39 45 18             	cmp    %eax,0x18(%ebp)
  100637:	76 13                	jbe    10064c <stab_binsearch+0xbb>
            *region_left = m;
  100639:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10063f:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100641:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100644:	83 c0 01             	add    $0x1,%eax
  100647:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10064a:	eb 43                	jmp    10068f <stab_binsearch+0xfe>
        } else if (stabs[m].n_value > addr) {
  10064c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10064f:	89 d0                	mov    %edx,%eax
  100651:	01 c0                	add    %eax,%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	c1 e0 02             	shl    $0x2,%eax
  100658:	89 c2                	mov    %eax,%edx
  10065a:	8b 45 08             	mov    0x8(%ebp),%eax
  10065d:	01 d0                	add    %edx,%eax
  10065f:	8b 40 08             	mov    0x8(%eax),%eax
  100662:	39 45 18             	cmp    %eax,0x18(%ebp)
  100665:	73 16                	jae    10067d <stab_binsearch+0xec>
            *region_right = m - 1;
  100667:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10066a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10066d:	8b 45 10             	mov    0x10(%ebp),%eax
  100670:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100672:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100675:	83 e8 01             	sub    $0x1,%eax
  100678:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10067b:	eb 12                	jmp    10068f <stab_binsearch+0xfe>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10067d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100680:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100683:	89 10                	mov    %edx,(%eax)
            l = m;
  100685:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100688:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10068b:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  10068f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100692:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100695:	0f 8e 22 ff ff ff    	jle    1005bd <stab_binsearch+0x2c>
        }
    }

    if (!any_matches) {
  10069b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10069f:	75 0f                	jne    1006b0 <stab_binsearch+0x11f>
        *region_right = *region_left - 1;
  1006a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a4:	8b 00                	mov    (%eax),%eax
  1006a6:	8d 50 ff             	lea    -0x1(%eax),%edx
  1006a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1006ac:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1006ae:	eb 3f                	jmp    1006ef <stab_binsearch+0x15e>
        l = *region_right;
  1006b0:	8b 45 10             	mov    0x10(%ebp),%eax
  1006b3:	8b 00                	mov    (%eax),%eax
  1006b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1006b8:	eb 04                	jmp    1006be <stab_binsearch+0x12d>
  1006ba:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1006be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c1:	8b 00                	mov    (%eax),%eax
  1006c3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1006c6:	7e 1f                	jle    1006e7 <stab_binsearch+0x156>
  1006c8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1006cb:	89 d0                	mov    %edx,%eax
  1006cd:	01 c0                	add    %eax,%eax
  1006cf:	01 d0                	add    %edx,%eax
  1006d1:	c1 e0 02             	shl    $0x2,%eax
  1006d4:	89 c2                	mov    %eax,%edx
  1006d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d9:	01 d0                	add    %edx,%eax
  1006db:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1006df:	0f b6 c0             	movzbl %al,%eax
  1006e2:	39 45 14             	cmp    %eax,0x14(%ebp)
  1006e5:	75 d3                	jne    1006ba <stab_binsearch+0x129>
        *region_left = l;
  1006e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ea:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1006ed:	89 10                	mov    %edx,(%eax)
}
  1006ef:	90                   	nop
  1006f0:	c9                   	leave  
  1006f1:	c3                   	ret    

001006f2 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1006f2:	55                   	push   %ebp
  1006f3:	89 e5                	mov    %esp,%ebp
  1006f5:	53                   	push   %ebx
  1006f6:	83 ec 34             	sub    $0x34,%esp
  1006f9:	e8 82 fb ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  1006fe:	81 c3 52 e2 00 00    	add    $0xe252,%ebx
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100704:	8b 45 0c             	mov    0xc(%ebp),%eax
  100707:	8d 93 18 4f ff ff    	lea    -0xb0e8(%ebx),%edx
  10070d:	89 10                	mov    %edx,(%eax)
    info->eip_line = 0;
  10070f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100712:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100719:	8b 45 0c             	mov    0xc(%ebp),%eax
  10071c:	8d 93 18 4f ff ff    	lea    -0xb0e8(%ebx),%edx
  100722:	89 50 08             	mov    %edx,0x8(%eax)
    info->eip_fn_namelen = 9;
  100725:	8b 45 0c             	mov    0xc(%ebp),%eax
  100728:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	8b 55 08             	mov    0x8(%ebp),%edx
  100735:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100738:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073b:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100742:	c7 c0 10 40 10 00    	mov    $0x104010,%eax
  100748:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stab_end = __STAB_END__;
  10074b:	c7 c0 88 bb 10 00    	mov    $0x10bb88,%eax
  100751:	89 45 f0             	mov    %eax,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100754:	c7 c0 89 bb 10 00    	mov    $0x10bb89,%eax
  10075a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10075d:	c7 c0 57 dc 10 00    	mov    $0x10dc57,%eax
  100763:	89 45 e8             	mov    %eax,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100766:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100769:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10076c:	76 0d                	jbe    10077b <debuginfo_eip+0x89>
  10076e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100771:	83 e8 01             	sub    $0x1,%eax
  100774:	0f b6 00             	movzbl (%eax),%eax
  100777:	84 c0                	test   %al,%al
  100779:	74 0a                	je     100785 <debuginfo_eip+0x93>
        return -1;
  10077b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100780:	e9 91 02 00 00       	jmp    100a16 <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100785:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10078c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	29 c2                	sub    %eax,%edx
  100794:	89 d0                	mov    %edx,%eax
  100796:	c1 f8 02             	sar    $0x2,%eax
  100799:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10079f:	83 e8 01             	sub    $0x1,%eax
  1007a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1007a5:	ff 75 08             	pushl  0x8(%ebp)
  1007a8:	6a 64                	push   $0x64
  1007aa:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1007ad:	50                   	push   %eax
  1007ae:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1007b1:	50                   	push   %eax
  1007b2:	ff 75 f4             	pushl  -0xc(%ebp)
  1007b5:	e8 d7 fd ff ff       	call   100591 <stab_binsearch>
  1007ba:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  1007bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007c0:	85 c0                	test   %eax,%eax
  1007c2:	75 0a                	jne    1007ce <debuginfo_eip+0xdc>
        return -1;
  1007c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007c9:	e9 48 02 00 00       	jmp    100a16 <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1007ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007d1:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1007d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007d7:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1007da:	ff 75 08             	pushl  0x8(%ebp)
  1007dd:	6a 24                	push   $0x24
  1007df:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1007e2:	50                   	push   %eax
  1007e3:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1007e6:	50                   	push   %eax
  1007e7:	ff 75 f4             	pushl  -0xc(%ebp)
  1007ea:	e8 a2 fd ff ff       	call   100591 <stab_binsearch>
  1007ef:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1007f2:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f8:	39 c2                	cmp    %eax,%edx
  1007fa:	7f 7c                	jg     100878 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1007fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007ff:	89 c2                	mov    %eax,%edx
  100801:	89 d0                	mov    %edx,%eax
  100803:	01 c0                	add    %eax,%eax
  100805:	01 d0                	add    %edx,%eax
  100807:	c1 e0 02             	shl    $0x2,%eax
  10080a:	89 c2                	mov    %eax,%edx
  10080c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10080f:	01 d0                	add    %edx,%eax
  100811:	8b 00                	mov    (%eax),%eax
  100813:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100816:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100819:	29 d1                	sub    %edx,%ecx
  10081b:	89 ca                	mov    %ecx,%edx
  10081d:	39 d0                	cmp    %edx,%eax
  10081f:	73 22                	jae    100843 <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100821:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100824:	89 c2                	mov    %eax,%edx
  100826:	89 d0                	mov    %edx,%eax
  100828:	01 c0                	add    %eax,%eax
  10082a:	01 d0                	add    %edx,%eax
  10082c:	c1 e0 02             	shl    $0x2,%eax
  10082f:	89 c2                	mov    %eax,%edx
  100831:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100834:	01 d0                	add    %edx,%eax
  100836:	8b 10                	mov    (%eax),%edx
  100838:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10083b:	01 c2                	add    %eax,%edx
  10083d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100840:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100843:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100846:	89 c2                	mov    %eax,%edx
  100848:	89 d0                	mov    %edx,%eax
  10084a:	01 c0                	add    %eax,%eax
  10084c:	01 d0                	add    %edx,%eax
  10084e:	c1 e0 02             	shl    $0x2,%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100856:	01 d0                	add    %edx,%eax
  100858:	8b 50 08             	mov    0x8(%eax),%edx
  10085b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10085e:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100861:	8b 45 0c             	mov    0xc(%ebp),%eax
  100864:	8b 40 10             	mov    0x10(%eax),%eax
  100867:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10086a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10086d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100870:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100873:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100876:	eb 15                	jmp    10088d <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100878:	8b 45 0c             	mov    0xc(%ebp),%eax
  10087b:	8b 55 08             	mov    0x8(%ebp),%edx
  10087e:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100881:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100884:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100887:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10088a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10088d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100890:	8b 40 08             	mov    0x8(%eax),%eax
  100893:	83 ec 08             	sub    $0x8,%esp
  100896:	6a 3a                	push   $0x3a
  100898:	50                   	push   %eax
  100899:	e8 16 25 00 00       	call   102db4 <strfind>
  10089e:	83 c4 10             	add    $0x10,%esp
  1008a1:	89 c2                	mov    %eax,%edx
  1008a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008a6:	8b 40 08             	mov    0x8(%eax),%eax
  1008a9:	29 c2                	sub    %eax,%edx
  1008ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ae:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1008b1:	83 ec 0c             	sub    $0xc,%esp
  1008b4:	ff 75 08             	pushl  0x8(%ebp)
  1008b7:	6a 44                	push   $0x44
  1008b9:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1008bc:	50                   	push   %eax
  1008bd:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1008c0:	50                   	push   %eax
  1008c1:	ff 75 f4             	pushl  -0xc(%ebp)
  1008c4:	e8 c8 fc ff ff       	call   100591 <stab_binsearch>
  1008c9:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  1008cc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008cf:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1008d2:	39 c2                	cmp    %eax,%edx
  1008d4:	7f 24                	jg     1008fa <debuginfo_eip+0x208>
        info->eip_line = stabs[rline].n_desc;
  1008d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1008d9:	89 c2                	mov    %eax,%edx
  1008db:	89 d0                	mov    %edx,%eax
  1008dd:	01 c0                	add    %eax,%eax
  1008df:	01 d0                	add    %edx,%eax
  1008e1:	c1 e0 02             	shl    $0x2,%eax
  1008e4:	89 c2                	mov    %eax,%edx
  1008e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e9:	01 d0                	add    %edx,%eax
  1008eb:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1008ef:	0f b7 d0             	movzwl %ax,%edx
  1008f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008f5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1008f8:	eb 13                	jmp    10090d <debuginfo_eip+0x21b>
        return -1;
  1008fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1008ff:	e9 12 01 00 00       	jmp    100a16 <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100904:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100907:	83 e8 01             	sub    $0x1,%eax
  10090a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  10090d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100910:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100913:	39 c2                	cmp    %eax,%edx
  100915:	7c 56                	jl     10096d <debuginfo_eip+0x27b>
           && stabs[lline].n_type != N_SOL
  100917:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10091a:	89 c2                	mov    %eax,%edx
  10091c:	89 d0                	mov    %edx,%eax
  10091e:	01 c0                	add    %eax,%eax
  100920:	01 d0                	add    %edx,%eax
  100922:	c1 e0 02             	shl    $0x2,%eax
  100925:	89 c2                	mov    %eax,%edx
  100927:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10092a:	01 d0                	add    %edx,%eax
  10092c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100930:	3c 84                	cmp    $0x84,%al
  100932:	74 39                	je     10096d <debuginfo_eip+0x27b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100934:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100937:	89 c2                	mov    %eax,%edx
  100939:	89 d0                	mov    %edx,%eax
  10093b:	01 c0                	add    %eax,%eax
  10093d:	01 d0                	add    %edx,%eax
  10093f:	c1 e0 02             	shl    $0x2,%eax
  100942:	89 c2                	mov    %eax,%edx
  100944:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100947:	01 d0                	add    %edx,%eax
  100949:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10094d:	3c 64                	cmp    $0x64,%al
  10094f:	75 b3                	jne    100904 <debuginfo_eip+0x212>
  100951:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100954:	89 c2                	mov    %eax,%edx
  100956:	89 d0                	mov    %edx,%eax
  100958:	01 c0                	add    %eax,%eax
  10095a:	01 d0                	add    %edx,%eax
  10095c:	c1 e0 02             	shl    $0x2,%eax
  10095f:	89 c2                	mov    %eax,%edx
  100961:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100964:	01 d0                	add    %edx,%eax
  100966:	8b 40 08             	mov    0x8(%eax),%eax
  100969:	85 c0                	test   %eax,%eax
  10096b:	74 97                	je     100904 <debuginfo_eip+0x212>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10096d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100970:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100973:	39 c2                	cmp    %eax,%edx
  100975:	7c 46                	jl     1009bd <debuginfo_eip+0x2cb>
  100977:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10097a:	89 c2                	mov    %eax,%edx
  10097c:	89 d0                	mov    %edx,%eax
  10097e:	01 c0                	add    %eax,%eax
  100980:	01 d0                	add    %edx,%eax
  100982:	c1 e0 02             	shl    $0x2,%eax
  100985:	89 c2                	mov    %eax,%edx
  100987:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10098a:	01 d0                	add    %edx,%eax
  10098c:	8b 00                	mov    (%eax),%eax
  10098e:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100991:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100994:	29 d1                	sub    %edx,%ecx
  100996:	89 ca                	mov    %ecx,%edx
  100998:	39 d0                	cmp    %edx,%eax
  10099a:	73 21                	jae    1009bd <debuginfo_eip+0x2cb>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10099c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10099f:	89 c2                	mov    %eax,%edx
  1009a1:	89 d0                	mov    %edx,%eax
  1009a3:	01 c0                	add    %eax,%eax
  1009a5:	01 d0                	add    %edx,%eax
  1009a7:	c1 e0 02             	shl    $0x2,%eax
  1009aa:	89 c2                	mov    %eax,%edx
  1009ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009af:	01 d0                	add    %edx,%eax
  1009b1:	8b 10                	mov    (%eax),%edx
  1009b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009b6:	01 c2                	add    %eax,%edx
  1009b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009bb:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1009bd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1009c0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1009c3:	39 c2                	cmp    %eax,%edx
  1009c5:	7d 4a                	jge    100a11 <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1009c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009ca:	83 c0 01             	add    $0x1,%eax
  1009cd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1009d0:	eb 18                	jmp    1009ea <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1009d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009d5:	8b 40 14             	mov    0x14(%eax),%eax
  1009d8:	8d 50 01             	lea    0x1(%eax),%edx
  1009db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009de:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1009e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009e4:	83 c0 01             	add    $0x1,%eax
  1009e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1009ea:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1009ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1009f0:	39 c2                	cmp    %eax,%edx
  1009f2:	7d 1d                	jge    100a11 <debuginfo_eip+0x31f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1009f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009f7:	89 c2                	mov    %eax,%edx
  1009f9:	89 d0                	mov    %edx,%eax
  1009fb:	01 c0                	add    %eax,%eax
  1009fd:	01 d0                	add    %edx,%eax
  1009ff:	c1 e0 02             	shl    $0x2,%eax
  100a02:	89 c2                	mov    %eax,%edx
  100a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a07:	01 d0                	add    %edx,%eax
  100a09:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100a0d:	3c a0                	cmp    $0xa0,%al
  100a0f:	74 c1                	je     1009d2 <debuginfo_eip+0x2e0>
        }
    }
    return 0;
  100a11:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100a16:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a19:	c9                   	leave  
  100a1a:	c3                   	ret    

00100a1b <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100a1b:	55                   	push   %ebp
  100a1c:	89 e5                	mov    %esp,%ebp
  100a1e:	53                   	push   %ebx
  100a1f:	83 ec 04             	sub    $0x4,%esp
  100a22:	e8 59 f8 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100a27:	81 c3 29 df 00 00    	add    $0xdf29,%ebx
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100a2d:	83 ec 0c             	sub    $0xc,%esp
  100a30:	8d 83 22 4f ff ff    	lea    -0xb0de(%ebx),%eax
  100a36:	50                   	push   %eax
  100a37:	e8 b7 f8 ff ff       	call   1002f3 <cprintf>
  100a3c:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100a3f:	83 ec 08             	sub    $0x8,%esp
  100a42:	c7 c0 00 00 10 00    	mov    $0x100000,%eax
  100a48:	50                   	push   %eax
  100a49:	8d 83 3b 4f ff ff    	lea    -0xb0c5(%ebx),%eax
  100a4f:	50                   	push   %eax
  100a50:	e8 9e f8 ff ff       	call   1002f3 <cprintf>
  100a55:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100a58:	83 ec 08             	sub    $0x8,%esp
  100a5b:	c7 c0 80 37 10 00    	mov    $0x103780,%eax
  100a61:	50                   	push   %eax
  100a62:	8d 83 53 4f ff ff    	lea    -0xb0ad(%ebx),%eax
  100a68:	50                   	push   %eax
  100a69:	e8 85 f8 ff ff       	call   1002f3 <cprintf>
  100a6e:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100a71:	83 ec 08             	sub    $0x8,%esp
  100a74:	c7 c0 50 e9 10 00    	mov    $0x10e950,%eax
  100a7a:	50                   	push   %eax
  100a7b:	8d 83 6b 4f ff ff    	lea    -0xb095(%ebx),%eax
  100a81:	50                   	push   %eax
  100a82:	e8 6c f8 ff ff       	call   1002f3 <cprintf>
  100a87:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100a8a:	83 ec 08             	sub    $0x8,%esp
  100a8d:	c7 c0 c0 fd 10 00    	mov    $0x10fdc0,%eax
  100a93:	50                   	push   %eax
  100a94:	8d 83 83 4f ff ff    	lea    -0xb07d(%ebx),%eax
  100a9a:	50                   	push   %eax
  100a9b:	e8 53 f8 ff ff       	call   1002f3 <cprintf>
  100aa0:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100aa3:	c7 c0 c0 fd 10 00    	mov    $0x10fdc0,%eax
  100aa9:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100aaf:	c7 c0 00 00 10 00    	mov    $0x100000,%eax
  100ab5:	29 c2                	sub    %eax,%edx
  100ab7:	89 d0                	mov    %edx,%eax
  100ab9:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100abf:	85 c0                	test   %eax,%eax
  100ac1:	0f 48 c2             	cmovs  %edx,%eax
  100ac4:	c1 f8 0a             	sar    $0xa,%eax
  100ac7:	83 ec 08             	sub    $0x8,%esp
  100aca:	50                   	push   %eax
  100acb:	8d 83 9c 4f ff ff    	lea    -0xb064(%ebx),%eax
  100ad1:	50                   	push   %eax
  100ad2:	e8 1c f8 ff ff       	call   1002f3 <cprintf>
  100ad7:	83 c4 10             	add    $0x10,%esp
}
  100ada:	90                   	nop
  100adb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ade:	c9                   	leave  
  100adf:	c3                   	ret    

00100ae0 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100ae0:	55                   	push   %ebp
  100ae1:	89 e5                	mov    %esp,%ebp
  100ae3:	53                   	push   %ebx
  100ae4:	81 ec 24 01 00 00    	sub    $0x124,%esp
  100aea:	e8 91 f7 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100aef:	81 c3 61 de 00 00    	add    $0xde61,%ebx
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100af5:	83 ec 08             	sub    $0x8,%esp
  100af8:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100afb:	50                   	push   %eax
  100afc:	ff 75 08             	pushl  0x8(%ebp)
  100aff:	e8 ee fb ff ff       	call   1006f2 <debuginfo_eip>
  100b04:	83 c4 10             	add    $0x10,%esp
  100b07:	85 c0                	test   %eax,%eax
  100b09:	74 17                	je     100b22 <print_debuginfo+0x42>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100b0b:	83 ec 08             	sub    $0x8,%esp
  100b0e:	ff 75 08             	pushl  0x8(%ebp)
  100b11:	8d 83 c6 4f ff ff    	lea    -0xb03a(%ebx),%eax
  100b17:	50                   	push   %eax
  100b18:	e8 d6 f7 ff ff       	call   1002f3 <cprintf>
  100b1d:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100b20:	eb 67                	jmp    100b89 <print_debuginfo+0xa9>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b29:	eb 1c                	jmp    100b47 <print_debuginfo+0x67>
            fnname[j] = info.eip_fn_name[j];
  100b2b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100b2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b31:	01 d0                	add    %edx,%eax
  100b33:	0f b6 00             	movzbl (%eax),%eax
  100b36:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100b3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b3f:	01 ca                	add    %ecx,%edx
  100b41:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b43:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b47:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100b4a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100b4d:	7c dc                	jl     100b2b <print_debuginfo+0x4b>
        fnname[j] = '\0';
  100b4f:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b58:	01 d0                	add    %edx,%eax
  100b5a:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100b60:	8b 55 08             	mov    0x8(%ebp),%edx
  100b63:	89 d1                	mov    %edx,%ecx
  100b65:	29 c1                	sub    %eax,%ecx
  100b67:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100b6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b6d:	83 ec 0c             	sub    $0xc,%esp
  100b70:	51                   	push   %ecx
  100b71:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100b77:	51                   	push   %ecx
  100b78:	52                   	push   %edx
  100b79:	50                   	push   %eax
  100b7a:	8d 83 e2 4f ff ff    	lea    -0xb01e(%ebx),%eax
  100b80:	50                   	push   %eax
  100b81:	e8 6d f7 ff ff       	call   1002f3 <cprintf>
  100b86:	83 c4 20             	add    $0x20,%esp
}
  100b89:	90                   	nop
  100b8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b8d:	c9                   	leave  
  100b8e:	c3                   	ret    

00100b8f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100b8f:	55                   	push   %ebp
  100b90:	89 e5                	mov    %esp,%ebp
  100b92:	83 ec 10             	sub    $0x10,%esp
  100b95:	e8 e2 f6 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100b9a:	05 b6 dd 00 00       	add    $0xddb6,%eax
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100b9f:	8b 45 04             	mov    0x4(%ebp),%eax
  100ba2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100ba5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100ba8:	c9                   	leave  
  100ba9:	c3                   	ret    

00100baa <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100baa:	55                   	push   %ebp
  100bab:	89 e5                	mov    %esp,%ebp
  100bad:	56                   	push   %esi
  100bae:	53                   	push   %ebx
  100baf:	83 ec 10             	sub    $0x10,%esp
  100bb2:	e8 c9 f6 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100bb7:	81 c3 99 dd 00 00    	add    $0xdd99,%ebx
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t esp=0;
  100bbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	uint32_t *ebp=0;
  100bc4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

	esp=read_eip();
  100bcb:	e8 bf ff ff ff       	call   100b8f <read_eip>
  100bd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100bd3:	89 e8                	mov    %ebp,%eax
  100bd5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    return ebp;
  100bd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
	ebp=read_ebp();
  100bdb:	89 45 f0             	mov    %eax,-0x10(%ebp)

	while(ebp)
  100bde:	eb 72                	jmp    100c52 <print_stackframe+0xa8>
	{
		cprintf("ebp:0x%08x eip:0x%08x args:", (uint32_t)ebp, esp);
  100be0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100be3:	83 ec 04             	sub    $0x4,%esp
  100be6:	ff 75 f4             	pushl  -0xc(%ebp)
  100be9:	50                   	push   %eax
  100bea:	8d 83 f4 4f ff ff    	lea    -0xb00c(%ebx),%eax
  100bf0:	50                   	push   %eax
  100bf1:	e8 fd f6 ff ff       	call   1002f3 <cprintf>
  100bf6:	83 c4 10             	add    $0x10,%esp
        cprintf("0x%08x 0x%08x 0x%08x 0x%08x\n", ebp[2], ebp[3], ebp[4], ebp[5]);
  100bf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bfc:	83 c0 14             	add    $0x14,%eax
  100bff:	8b 30                	mov    (%eax),%esi
  100c01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c04:	83 c0 10             	add    $0x10,%eax
  100c07:	8b 08                	mov    (%eax),%ecx
  100c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c0c:	83 c0 0c             	add    $0xc,%eax
  100c0f:	8b 10                	mov    (%eax),%edx
  100c11:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c14:	83 c0 08             	add    $0x8,%eax
  100c17:	8b 00                	mov    (%eax),%eax
  100c19:	83 ec 0c             	sub    $0xc,%esp
  100c1c:	56                   	push   %esi
  100c1d:	51                   	push   %ecx
  100c1e:	52                   	push   %edx
  100c1f:	50                   	push   %eax
  100c20:	8d 83 10 50 ff ff    	lea    -0xaff0(%ebx),%eax
  100c26:	50                   	push   %eax
  100c27:	e8 c7 f6 ff ff       	call   1002f3 <cprintf>
  100c2c:	83 c4 20             	add    $0x20,%esp
 
        print_debuginfo(esp - 1);
  100c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c32:	83 e8 01             	sub    $0x1,%eax
  100c35:	83 ec 0c             	sub    $0xc,%esp
  100c38:	50                   	push   %eax
  100c39:	e8 a2 fe ff ff       	call   100ae0 <print_debuginfo>
  100c3e:	83 c4 10             	add    $0x10,%esp
 
        esp = ebp[1];
  100c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c44:	8b 40 04             	mov    0x4(%eax),%eax
  100c47:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ebp = (uint32_t *)*ebp;
  100c4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c4d:	8b 00                	mov    (%eax),%eax
  100c4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while(ebp)
  100c52:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c56:	75 88                	jne    100be0 <print_stackframe+0x36>
	}

}
  100c58:	90                   	nop
  100c59:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c5c:	5b                   	pop    %ebx
  100c5d:	5e                   	pop    %esi
  100c5e:	5d                   	pop    %ebp
  100c5f:	c3                   	ret    

00100c60 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100c60:	55                   	push   %ebp
  100c61:	89 e5                	mov    %esp,%ebp
  100c63:	53                   	push   %ebx
  100c64:	83 ec 14             	sub    $0x14,%esp
  100c67:	e8 14 f6 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100c6c:	81 c3 e4 dc 00 00    	add    $0xdce4,%ebx
    int argc = 0;
  100c72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c79:	eb 0c                	jmp    100c87 <parse+0x27>
            *buf ++ = '\0';
  100c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  100c7e:	8d 50 01             	lea    0x1(%eax),%edx
  100c81:	89 55 08             	mov    %edx,0x8(%ebp)
  100c84:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c87:	8b 45 08             	mov    0x8(%ebp),%eax
  100c8a:	0f b6 00             	movzbl (%eax),%eax
  100c8d:	84 c0                	test   %al,%al
  100c8f:	74 20                	je     100cb1 <parse+0x51>
  100c91:	8b 45 08             	mov    0x8(%ebp),%eax
  100c94:	0f b6 00             	movzbl (%eax),%eax
  100c97:	0f be c0             	movsbl %al,%eax
  100c9a:	83 ec 08             	sub    $0x8,%esp
  100c9d:	50                   	push   %eax
  100c9e:	8d 83 b0 50 ff ff    	lea    -0xaf50(%ebx),%eax
  100ca4:	50                   	push   %eax
  100ca5:	e8 cd 20 00 00       	call   102d77 <strchr>
  100caa:	83 c4 10             	add    $0x10,%esp
  100cad:	85 c0                	test   %eax,%eax
  100caf:	75 ca                	jne    100c7b <parse+0x1b>
        }
        if (*buf == '\0') {
  100cb1:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb4:	0f b6 00             	movzbl (%eax),%eax
  100cb7:	84 c0                	test   %al,%al
  100cb9:	74 69                	je     100d24 <parse+0xc4>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100cbb:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100cbf:	75 14                	jne    100cd5 <parse+0x75>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100cc1:	83 ec 08             	sub    $0x8,%esp
  100cc4:	6a 10                	push   $0x10
  100cc6:	8d 83 b5 50 ff ff    	lea    -0xaf4b(%ebx),%eax
  100ccc:	50                   	push   %eax
  100ccd:	e8 21 f6 ff ff       	call   1002f3 <cprintf>
  100cd2:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd8:	8d 50 01             	lea    0x1(%eax),%edx
  100cdb:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100cde:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ce5:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ce8:	01 c2                	add    %eax,%edx
  100cea:	8b 45 08             	mov    0x8(%ebp),%eax
  100ced:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100cef:	eb 04                	jmp    100cf5 <parse+0x95>
            buf ++;
  100cf1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  100cf8:	0f b6 00             	movzbl (%eax),%eax
  100cfb:	84 c0                	test   %al,%al
  100cfd:	74 88                	je     100c87 <parse+0x27>
  100cff:	8b 45 08             	mov    0x8(%ebp),%eax
  100d02:	0f b6 00             	movzbl (%eax),%eax
  100d05:	0f be c0             	movsbl %al,%eax
  100d08:	83 ec 08             	sub    $0x8,%esp
  100d0b:	50                   	push   %eax
  100d0c:	8d 83 b0 50 ff ff    	lea    -0xaf50(%ebx),%eax
  100d12:	50                   	push   %eax
  100d13:	e8 5f 20 00 00       	call   102d77 <strchr>
  100d18:	83 c4 10             	add    $0x10,%esp
  100d1b:	85 c0                	test   %eax,%eax
  100d1d:	74 d2                	je     100cf1 <parse+0x91>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100d1f:	e9 63 ff ff ff       	jmp    100c87 <parse+0x27>
            break;
  100d24:	90                   	nop
        }
    }
    return argc;
  100d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100d28:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d2b:	c9                   	leave  
  100d2c:	c3                   	ret    

00100d2d <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100d2d:	55                   	push   %ebp
  100d2e:	89 e5                	mov    %esp,%ebp
  100d30:	56                   	push   %esi
  100d31:	53                   	push   %ebx
  100d32:	83 ec 50             	sub    $0x50,%esp
  100d35:	e8 46 f5 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100d3a:	81 c3 16 dc 00 00    	add    $0xdc16,%ebx
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100d40:	83 ec 08             	sub    $0x8,%esp
  100d43:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100d46:	50                   	push   %eax
  100d47:	ff 75 08             	pushl  0x8(%ebp)
  100d4a:	e8 11 ff ff ff       	call   100c60 <parse>
  100d4f:	83 c4 10             	add    $0x10,%esp
  100d52:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100d55:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100d59:	75 0a                	jne    100d65 <runcmd+0x38>
        return 0;
  100d5b:	b8 00 00 00 00       	mov    $0x0,%eax
  100d60:	e9 8b 00 00 00       	jmp    100df0 <runcmd+0xc3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d6c:	eb 5f                	jmp    100dcd <runcmd+0xa0>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100d6e:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100d71:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d74:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100d7a:	89 d0                	mov    %edx,%eax
  100d7c:	01 c0                	add    %eax,%eax
  100d7e:	01 d0                	add    %edx,%eax
  100d80:	c1 e0 02             	shl    $0x2,%eax
  100d83:	01 f0                	add    %esi,%eax
  100d85:	8b 00                	mov    (%eax),%eax
  100d87:	83 ec 08             	sub    $0x8,%esp
  100d8a:	51                   	push   %ecx
  100d8b:	50                   	push   %eax
  100d8c:	e8 32 1f 00 00       	call   102cc3 <strcmp>
  100d91:	83 c4 10             	add    $0x10,%esp
  100d94:	85 c0                	test   %eax,%eax
  100d96:	75 31                	jne    100dc9 <runcmd+0x9c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100d98:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d9b:	8d 8b 18 00 00 00    	lea    0x18(%ebx),%ecx
  100da1:	89 d0                	mov    %edx,%eax
  100da3:	01 c0                	add    %eax,%eax
  100da5:	01 d0                	add    %edx,%eax
  100da7:	c1 e0 02             	shl    $0x2,%eax
  100daa:	01 c8                	add    %ecx,%eax
  100dac:	8b 10                	mov    (%eax),%edx
  100dae:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100db1:	83 c0 04             	add    $0x4,%eax
  100db4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100db7:	83 e9 01             	sub    $0x1,%ecx
  100dba:	83 ec 04             	sub    $0x4,%esp
  100dbd:	ff 75 0c             	pushl  0xc(%ebp)
  100dc0:	50                   	push   %eax
  100dc1:	51                   	push   %ecx
  100dc2:	ff d2                	call   *%edx
  100dc4:	83 c4 10             	add    $0x10,%esp
  100dc7:	eb 27                	jmp    100df0 <runcmd+0xc3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100dc9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100dcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dd0:	83 f8 02             	cmp    $0x2,%eax
  100dd3:	76 99                	jbe    100d6e <runcmd+0x41>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100dd5:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100dd8:	83 ec 08             	sub    $0x8,%esp
  100ddb:	50                   	push   %eax
  100ddc:	8d 83 d3 50 ff ff    	lea    -0xaf2d(%ebx),%eax
  100de2:	50                   	push   %eax
  100de3:	e8 0b f5 ff ff       	call   1002f3 <cprintf>
  100de8:	83 c4 10             	add    $0x10,%esp
    return 0;
  100deb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100df0:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100df3:	5b                   	pop    %ebx
  100df4:	5e                   	pop    %esi
  100df5:	5d                   	pop    %ebp
  100df6:	c3                   	ret    

00100df7 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100df7:	55                   	push   %ebp
  100df8:	89 e5                	mov    %esp,%ebp
  100dfa:	53                   	push   %ebx
  100dfb:	83 ec 14             	sub    $0x14,%esp
  100dfe:	e8 7d f4 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100e03:	81 c3 4d db 00 00    	add    $0xdb4d,%ebx
    cprintf("Welcome to the kernel debug monitor!!\n");
  100e09:	83 ec 0c             	sub    $0xc,%esp
  100e0c:	8d 83 ec 50 ff ff    	lea    -0xaf14(%ebx),%eax
  100e12:	50                   	push   %eax
  100e13:	e8 db f4 ff ff       	call   1002f3 <cprintf>
  100e18:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100e1b:	83 ec 0c             	sub    $0xc,%esp
  100e1e:	8d 83 14 51 ff ff    	lea    -0xaeec(%ebx),%eax
  100e24:	50                   	push   %eax
  100e25:	e8 c9 f4 ff ff       	call   1002f3 <cprintf>
  100e2a:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100e2d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100e31:	74 0e                	je     100e41 <kmonitor+0x4a>
        print_trapframe(tf);
  100e33:	83 ec 0c             	sub    $0xc,%esp
  100e36:	ff 75 08             	pushl  0x8(%ebp)
  100e39:	e8 8d 0d 00 00       	call   101bcb <print_trapframe>
  100e3e:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100e41:	83 ec 0c             	sub    $0xc,%esp
  100e44:	8d 83 39 51 ff ff    	lea    -0xaec7(%ebx),%eax
  100e4a:	50                   	push   %eax
  100e4b:	e8 7b f5 ff ff       	call   1003cb <readline>
  100e50:	83 c4 10             	add    $0x10,%esp
  100e53:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e56:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100e5a:	74 e5                	je     100e41 <kmonitor+0x4a>
            if (runcmd(buf, tf) < 0) {
  100e5c:	83 ec 08             	sub    $0x8,%esp
  100e5f:	ff 75 08             	pushl  0x8(%ebp)
  100e62:	ff 75 f4             	pushl  -0xc(%ebp)
  100e65:	e8 c3 fe ff ff       	call   100d2d <runcmd>
  100e6a:	83 c4 10             	add    $0x10,%esp
  100e6d:	85 c0                	test   %eax,%eax
  100e6f:	78 02                	js     100e73 <kmonitor+0x7c>
        if ((buf = readline("K> ")) != NULL) {
  100e71:	eb ce                	jmp    100e41 <kmonitor+0x4a>
                break;
  100e73:	90                   	nop
            }
        }
    }
}
  100e74:	90                   	nop
  100e75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100e78:	c9                   	leave  
  100e79:	c3                   	ret    

00100e7a <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100e7a:	55                   	push   %ebp
  100e7b:	89 e5                	mov    %esp,%ebp
  100e7d:	56                   	push   %esi
  100e7e:	53                   	push   %ebx
  100e7f:	83 ec 10             	sub    $0x10,%esp
  100e82:	e8 f9 f3 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100e87:	81 c3 c9 da 00 00    	add    $0xdac9,%ebx
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100e8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100e94:	eb 44                	jmp    100eda <mon_help+0x60>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100e96:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e99:	8d 8b 14 00 00 00    	lea    0x14(%ebx),%ecx
  100e9f:	89 d0                	mov    %edx,%eax
  100ea1:	01 c0                	add    %eax,%eax
  100ea3:	01 d0                	add    %edx,%eax
  100ea5:	c1 e0 02             	shl    $0x2,%eax
  100ea8:	01 c8                	add    %ecx,%eax
  100eaa:	8b 08                	mov    (%eax),%ecx
  100eac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100eaf:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100eb5:	89 d0                	mov    %edx,%eax
  100eb7:	01 c0                	add    %eax,%eax
  100eb9:	01 d0                	add    %edx,%eax
  100ebb:	c1 e0 02             	shl    $0x2,%eax
  100ebe:	01 f0                	add    %esi,%eax
  100ec0:	8b 00                	mov    (%eax),%eax
  100ec2:	83 ec 04             	sub    $0x4,%esp
  100ec5:	51                   	push   %ecx
  100ec6:	50                   	push   %eax
  100ec7:	8d 83 3d 51 ff ff    	lea    -0xaec3(%ebx),%eax
  100ecd:	50                   	push   %eax
  100ece:	e8 20 f4 ff ff       	call   1002f3 <cprintf>
  100ed3:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100ed6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100eda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100edd:	83 f8 02             	cmp    $0x2,%eax
  100ee0:	76 b4                	jbe    100e96 <mon_help+0x1c>
    }
    return 0;
  100ee2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ee7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100eea:	5b                   	pop    %ebx
  100eeb:	5e                   	pop    %esi
  100eec:	5d                   	pop    %ebp
  100eed:	c3                   	ret    

00100eee <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100eee:	55                   	push   %ebp
  100eef:	89 e5                	mov    %esp,%ebp
  100ef1:	53                   	push   %ebx
  100ef2:	83 ec 04             	sub    $0x4,%esp
  100ef5:	e8 82 f3 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100efa:	05 56 da 00 00       	add    $0xda56,%eax
    print_kerninfo();
  100eff:	89 c3                	mov    %eax,%ebx
  100f01:	e8 15 fb ff ff       	call   100a1b <print_kerninfo>
    return 0;
  100f06:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100f0b:	83 c4 04             	add    $0x4,%esp
  100f0e:	5b                   	pop    %ebx
  100f0f:	5d                   	pop    %ebp
  100f10:	c3                   	ret    

00100f11 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100f11:	55                   	push   %ebp
  100f12:	89 e5                	mov    %esp,%ebp
  100f14:	53                   	push   %ebx
  100f15:	83 ec 04             	sub    $0x4,%esp
  100f18:	e8 5f f3 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100f1d:	05 33 da 00 00       	add    $0xda33,%eax
    print_stackframe();
  100f22:	89 c3                	mov    %eax,%ebx
  100f24:	e8 81 fc ff ff       	call   100baa <print_stackframe>
    return 0;
  100f29:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100f2e:	83 c4 04             	add    $0x4,%esp
  100f31:	5b                   	pop    %ebx
  100f32:	5d                   	pop    %ebp
  100f33:	c3                   	ret    

00100f34 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100f34:	55                   	push   %ebp
  100f35:	89 e5                	mov    %esp,%ebp
  100f37:	53                   	push   %ebx
  100f38:	83 ec 14             	sub    $0x14,%esp
  100f3b:	e8 40 f3 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  100f40:	81 c3 10 da 00 00    	add    $0xda10,%ebx
  100f46:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100f4c:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f50:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f54:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f58:	ee                   	out    %al,(%dx)
  100f59:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100f5f:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100f63:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f67:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f6b:	ee                   	out    %al,(%dx)
  100f6c:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100f72:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
  100f76:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f7a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f7e:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100f7f:	c7 c0 a8 f9 10 00    	mov    $0x10f9a8,%eax
  100f85:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

    cprintf("++ setup timer interrupts\n");
  100f8b:	83 ec 0c             	sub    $0xc,%esp
  100f8e:	8d 83 46 51 ff ff    	lea    -0xaeba(%ebx),%eax
  100f94:	50                   	push   %eax
  100f95:	e8 59 f3 ff ff       	call   1002f3 <cprintf>
  100f9a:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100f9d:	83 ec 0c             	sub    $0xc,%esp
  100fa0:	6a 00                	push   $0x0
  100fa2:	e8 e7 09 00 00       	call   10198e <pic_enable>
  100fa7:	83 c4 10             	add    $0x10,%esp
}
  100faa:	90                   	nop
  100fab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100fae:	c9                   	leave  
  100faf:	c3                   	ret    

00100fb0 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100fb0:	55                   	push   %ebp
  100fb1:	89 e5                	mov    %esp,%ebp
  100fb3:	83 ec 10             	sub    $0x10,%esp
  100fb6:	e8 c1 f2 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  100fbb:	05 95 d9 00 00       	add    $0xd995,%eax
  100fc0:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fc6:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fca:	89 c2                	mov    %eax,%edx
  100fcc:	ec                   	in     (%dx),%al
  100fcd:	88 45 f1             	mov    %al,-0xf(%ebp)
  100fd0:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100fd6:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fda:	89 c2                	mov    %eax,%edx
  100fdc:	ec                   	in     (%dx),%al
  100fdd:	88 45 f5             	mov    %al,-0xb(%ebp)
  100fe0:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100fe6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fea:	89 c2                	mov    %eax,%edx
  100fec:	ec                   	in     (%dx),%al
  100fed:	88 45 f9             	mov    %al,-0x7(%ebp)
  100ff0:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100ff6:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100ffa:	89 c2                	mov    %eax,%edx
  100ffc:	ec                   	in     (%dx),%al
  100ffd:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  101000:	90                   	nop
  101001:	c9                   	leave  
  101002:	c3                   	ret    

00101003 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  101003:	55                   	push   %ebp
  101004:	89 e5                	mov    %esp,%ebp
  101006:	83 ec 20             	sub    $0x20,%esp
  101009:	e8 17 09 00 00       	call   101925 <__x86.get_pc_thunk.cx>
  10100e:	81 c1 42 d9 00 00    	add    $0xd942,%ecx
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  101014:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  10101b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10101e:	0f b7 00             	movzwl (%eax),%eax
  101021:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  101025:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101028:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  10102d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101030:	0f b7 00             	movzwl (%eax),%eax
  101033:	66 3d 5a a5          	cmp    $0xa55a,%ax
  101037:	74 12                	je     10104b <cga_init+0x48>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  101039:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  101040:	66 c7 81 b6 05 00 00 	movw   $0x3b4,0x5b6(%ecx)
  101047:	b4 03 
  101049:	eb 13                	jmp    10105e <cga_init+0x5b>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  10104b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10104e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101052:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  101055:	66 c7 81 b6 05 00 00 	movw   $0x3d4,0x5b6(%ecx)
  10105c:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  10105e:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  101065:	0f b7 c0             	movzwl %ax,%eax
  101068:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  10106c:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101070:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101074:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101078:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  101079:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  101080:	83 c0 01             	add    $0x1,%eax
  101083:	0f b7 c0             	movzwl %ax,%eax
  101086:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10108a:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  10108e:	89 c2                	mov    %eax,%edx
  101090:	ec                   	in     (%dx),%al
  101091:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  101094:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101098:	0f b6 c0             	movzbl %al,%eax
  10109b:	c1 e0 08             	shl    $0x8,%eax
  10109e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  1010a1:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  1010a8:	0f b7 c0             	movzwl %ax,%eax
  1010ab:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1010af:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010b3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010b7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010bb:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  1010bc:	0f b7 81 b6 05 00 00 	movzwl 0x5b6(%ecx),%eax
  1010c3:	83 c0 01             	add    $0x1,%eax
  1010c6:	0f b7 c0             	movzwl %ax,%eax
  1010c9:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1010cd:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1010d1:	89 c2                	mov    %eax,%edx
  1010d3:	ec                   	in     (%dx),%al
  1010d4:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  1010d7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010db:	0f b6 c0             	movzbl %al,%eax
  1010de:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  1010e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010e4:	89 81 b0 05 00 00    	mov    %eax,0x5b0(%ecx)
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  1010ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1010ed:	66 89 81 b4 05 00 00 	mov    %ax,0x5b4(%ecx)
}
  1010f4:	90                   	nop
  1010f5:	c9                   	leave  
  1010f6:	c3                   	ret    

001010f7 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  1010f7:	55                   	push   %ebp
  1010f8:	89 e5                	mov    %esp,%ebp
  1010fa:	53                   	push   %ebx
  1010fb:	83 ec 34             	sub    $0x34,%esp
  1010fe:	e8 22 08 00 00       	call   101925 <__x86.get_pc_thunk.cx>
  101103:	81 c1 4d d8 00 00    	add    $0xd84d,%ecx
  101109:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  10110f:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101113:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101117:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10111b:	ee                   	out    %al,(%dx)
  10111c:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  101122:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
  101126:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10112a:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10112e:	ee                   	out    %al,(%dx)
  10112f:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  101135:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
  101139:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10113d:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101141:	ee                   	out    %al,(%dx)
  101142:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  101148:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  10114c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101150:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101154:	ee                   	out    %al,(%dx)
  101155:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  10115b:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  10115f:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101163:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101167:	ee                   	out    %al,(%dx)
  101168:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  10116e:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  101172:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101176:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10117a:	ee                   	out    %al,(%dx)
  10117b:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  101181:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
  101185:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101189:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10118d:	ee                   	out    %al,(%dx)
  10118e:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101194:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  101198:	89 c2                	mov    %eax,%edx
  10119a:	ec                   	in     (%dx),%al
  10119b:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  10119e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  1011a2:	3c ff                	cmp    $0xff,%al
  1011a4:	0f 95 c0             	setne  %al
  1011a7:	0f b6 c0             	movzbl %al,%eax
  1011aa:	89 81 b8 05 00 00    	mov    %eax,0x5b8(%ecx)
  1011b0:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1011b6:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1011ba:	89 c2                	mov    %eax,%edx
  1011bc:	ec                   	in     (%dx),%al
  1011bd:	88 45 f1             	mov    %al,-0xf(%ebp)
  1011c0:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1011c6:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1011ca:	89 c2                	mov    %eax,%edx
  1011cc:	ec                   	in     (%dx),%al
  1011cd:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  1011d0:	8b 81 b8 05 00 00    	mov    0x5b8(%ecx),%eax
  1011d6:	85 c0                	test   %eax,%eax
  1011d8:	74 0f                	je     1011e9 <serial_init+0xf2>
        pic_enable(IRQ_COM1);
  1011da:	83 ec 0c             	sub    $0xc,%esp
  1011dd:	6a 04                	push   $0x4
  1011df:	89 cb                	mov    %ecx,%ebx
  1011e1:	e8 a8 07 00 00       	call   10198e <pic_enable>
  1011e6:	83 c4 10             	add    $0x10,%esp
    }
}
  1011e9:	90                   	nop
  1011ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011ed:	c9                   	leave  
  1011ee:	c3                   	ret    

001011ef <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  1011ef:	55                   	push   %ebp
  1011f0:	89 e5                	mov    %esp,%ebp
  1011f2:	83 ec 20             	sub    $0x20,%esp
  1011f5:	e8 82 f0 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1011fa:	05 56 d7 00 00       	add    $0xd756,%eax
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  1011ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101206:	eb 09                	jmp    101211 <lpt_putc_sub+0x22>
        delay();
  101208:	e8 a3 fd ff ff       	call   100fb0 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10120d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101211:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101217:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10121b:	89 c2                	mov    %eax,%edx
  10121d:	ec                   	in     (%dx),%al
  10121e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101221:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101225:	84 c0                	test   %al,%al
  101227:	78 09                	js     101232 <lpt_putc_sub+0x43>
  101229:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101230:	7e d6                	jle    101208 <lpt_putc_sub+0x19>
    }
    outb(LPTPORT + 0, c);
  101232:	8b 45 08             	mov    0x8(%ebp),%eax
  101235:	0f b6 c0             	movzbl %al,%eax
  101238:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10123e:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101241:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101245:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101249:	ee                   	out    %al,(%dx)
  10124a:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101250:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101254:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101258:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10125c:	ee                   	out    %al,(%dx)
  10125d:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101263:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
  101267:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10126b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10126f:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101270:	90                   	nop
  101271:	c9                   	leave  
  101272:	c3                   	ret    

00101273 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101273:	55                   	push   %ebp
  101274:	89 e5                	mov    %esp,%ebp
  101276:	e8 01 f0 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  10127b:	05 d5 d6 00 00       	add    $0xd6d5,%eax
    if (c != '\b') {
  101280:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101284:	74 0d                	je     101293 <lpt_putc+0x20>
        lpt_putc_sub(c);
  101286:	ff 75 08             	pushl  0x8(%ebp)
  101289:	e8 61 ff ff ff       	call   1011ef <lpt_putc_sub>
  10128e:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101291:	eb 1e                	jmp    1012b1 <lpt_putc+0x3e>
        lpt_putc_sub('\b');
  101293:	6a 08                	push   $0x8
  101295:	e8 55 ff ff ff       	call   1011ef <lpt_putc_sub>
  10129a:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  10129d:	6a 20                	push   $0x20
  10129f:	e8 4b ff ff ff       	call   1011ef <lpt_putc_sub>
  1012a4:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  1012a7:	6a 08                	push   $0x8
  1012a9:	e8 41 ff ff ff       	call   1011ef <lpt_putc_sub>
  1012ae:	83 c4 04             	add    $0x4,%esp
}
  1012b1:	90                   	nop
  1012b2:	c9                   	leave  
  1012b3:	c3                   	ret    

001012b4 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1012b4:	55                   	push   %ebp
  1012b5:	89 e5                	mov    %esp,%ebp
  1012b7:	56                   	push   %esi
  1012b8:	53                   	push   %ebx
  1012b9:	83 ec 20             	sub    $0x20,%esp
  1012bc:	e8 bf ef ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  1012c1:	81 c3 8f d6 00 00    	add    $0xd68f,%ebx
    // set black on white
    if (!(c & ~0xFF)) {
  1012c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ca:	b0 00                	mov    $0x0,%al
  1012cc:	85 c0                	test   %eax,%eax
  1012ce:	75 07                	jne    1012d7 <cga_putc+0x23>
        c |= 0x0700;
  1012d0:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1012d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012da:	0f b6 c0             	movzbl %al,%eax
  1012dd:	83 f8 0a             	cmp    $0xa,%eax
  1012e0:	74 54                	je     101336 <cga_putc+0x82>
  1012e2:	83 f8 0d             	cmp    $0xd,%eax
  1012e5:	74 60                	je     101347 <cga_putc+0x93>
  1012e7:	83 f8 08             	cmp    $0x8,%eax
  1012ea:	0f 85 92 00 00 00    	jne    101382 <cga_putc+0xce>
    case '\b':
        if (crt_pos > 0) {
  1012f0:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  1012f7:	66 85 c0             	test   %ax,%ax
  1012fa:	0f 84 a8 00 00 00    	je     1013a8 <cga_putc+0xf4>
            crt_pos --;
  101300:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101307:	83 e8 01             	sub    $0x1,%eax
  10130a:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101311:	8b 45 08             	mov    0x8(%ebp),%eax
  101314:	b0 00                	mov    $0x0,%al
  101316:	83 c8 20             	or     $0x20,%eax
  101319:	89 c1                	mov    %eax,%ecx
  10131b:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  101321:	0f b7 93 b4 05 00 00 	movzwl 0x5b4(%ebx),%edx
  101328:	0f b7 d2             	movzwl %dx,%edx
  10132b:	01 d2                	add    %edx,%edx
  10132d:	01 d0                	add    %edx,%eax
  10132f:	89 ca                	mov    %ecx,%edx
  101331:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  101334:	eb 72                	jmp    1013a8 <cga_putc+0xf4>
    case '\n':
        crt_pos += CRT_COLS;
  101336:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  10133d:	83 c0 50             	add    $0x50,%eax
  101340:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101347:	0f b7 b3 b4 05 00 00 	movzwl 0x5b4(%ebx),%esi
  10134e:	0f b7 8b b4 05 00 00 	movzwl 0x5b4(%ebx),%ecx
  101355:	0f b7 c1             	movzwl %cx,%eax
  101358:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10135e:	c1 e8 10             	shr    $0x10,%eax
  101361:	89 c2                	mov    %eax,%edx
  101363:	66 c1 ea 06          	shr    $0x6,%dx
  101367:	89 d0                	mov    %edx,%eax
  101369:	c1 e0 02             	shl    $0x2,%eax
  10136c:	01 d0                	add    %edx,%eax
  10136e:	c1 e0 04             	shl    $0x4,%eax
  101371:	29 c1                	sub    %eax,%ecx
  101373:	89 ca                	mov    %ecx,%edx
  101375:	89 f0                	mov    %esi,%eax
  101377:	29 d0                	sub    %edx,%eax
  101379:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
        break;
  101380:	eb 27                	jmp    1013a9 <cga_putc+0xf5>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101382:	8b 8b b0 05 00 00    	mov    0x5b0(%ebx),%ecx
  101388:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  10138f:	8d 50 01             	lea    0x1(%eax),%edx
  101392:	66 89 93 b4 05 00 00 	mov    %dx,0x5b4(%ebx)
  101399:	0f b7 c0             	movzwl %ax,%eax
  10139c:	01 c0                	add    %eax,%eax
  10139e:	01 c8                	add    %ecx,%eax
  1013a0:	8b 55 08             	mov    0x8(%ebp),%edx
  1013a3:	66 89 10             	mov    %dx,(%eax)
        break;
  1013a6:	eb 01                	jmp    1013a9 <cga_putc+0xf5>
        break;
  1013a8:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1013a9:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  1013b0:	66 3d cf 07          	cmp    $0x7cf,%ax
  1013b4:	76 5d                	jbe    101413 <cga_putc+0x15f>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1013b6:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  1013bc:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1013c2:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  1013c8:	83 ec 04             	sub    $0x4,%esp
  1013cb:	68 00 0f 00 00       	push   $0xf00
  1013d0:	52                   	push   %edx
  1013d1:	50                   	push   %eax
  1013d2:	e8 c7 1b 00 00       	call   102f9e <memmove>
  1013d7:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1013da:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1013e1:	eb 16                	jmp    1013f9 <cga_putc+0x145>
            crt_buf[i] = 0x0700 | ' ';
  1013e3:	8b 83 b0 05 00 00    	mov    0x5b0(%ebx),%eax
  1013e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013ec:	01 d2                	add    %edx,%edx
  1013ee:	01 d0                	add    %edx,%eax
  1013f0:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1013f5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1013f9:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101400:	7e e1                	jle    1013e3 <cga_putc+0x12f>
        }
        crt_pos -= CRT_COLS;
  101402:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101409:	83 e8 50             	sub    $0x50,%eax
  10140c:	66 89 83 b4 05 00 00 	mov    %ax,0x5b4(%ebx)
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101413:	0f b7 83 b6 05 00 00 	movzwl 0x5b6(%ebx),%eax
  10141a:	0f b7 c0             	movzwl %ax,%eax
  10141d:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101421:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
  101425:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101429:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10142d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  10142e:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  101435:	66 c1 e8 08          	shr    $0x8,%ax
  101439:	0f b6 c0             	movzbl %al,%eax
  10143c:	0f b7 93 b6 05 00 00 	movzwl 0x5b6(%ebx),%edx
  101443:	83 c2 01             	add    $0x1,%edx
  101446:	0f b7 d2             	movzwl %dx,%edx
  101449:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10144d:	88 45 e9             	mov    %al,-0x17(%ebp)
  101450:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101454:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101458:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101459:	0f b7 83 b6 05 00 00 	movzwl 0x5b6(%ebx),%eax
  101460:	0f b7 c0             	movzwl %ax,%eax
  101463:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101467:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
  10146b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10146f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101473:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101474:	0f b7 83 b4 05 00 00 	movzwl 0x5b4(%ebx),%eax
  10147b:	0f b6 c0             	movzbl %al,%eax
  10147e:	0f b7 93 b6 05 00 00 	movzwl 0x5b6(%ebx),%edx
  101485:	83 c2 01             	add    $0x1,%edx
  101488:	0f b7 d2             	movzwl %dx,%edx
  10148b:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10148f:	88 45 f1             	mov    %al,-0xf(%ebp)
  101492:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101496:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10149a:	ee                   	out    %al,(%dx)
}
  10149b:	90                   	nop
  10149c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10149f:	5b                   	pop    %ebx
  1014a0:	5e                   	pop    %esi
  1014a1:	5d                   	pop    %ebp
  1014a2:	c3                   	ret    

001014a3 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1014a3:	55                   	push   %ebp
  1014a4:	89 e5                	mov    %esp,%ebp
  1014a6:	83 ec 10             	sub    $0x10,%esp
  1014a9:	e8 ce ed ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1014ae:	05 a2 d4 00 00       	add    $0xd4a2,%eax
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1014b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1014ba:	eb 09                	jmp    1014c5 <serial_putc_sub+0x22>
        delay();
  1014bc:	e8 ef fa ff ff       	call   100fb0 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1014c1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1014c5:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014cb:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1014cf:	89 c2                	mov    %eax,%edx
  1014d1:	ec                   	in     (%dx),%al
  1014d2:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1014d5:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1014d9:	0f b6 c0             	movzbl %al,%eax
  1014dc:	83 e0 20             	and    $0x20,%eax
  1014df:	85 c0                	test   %eax,%eax
  1014e1:	75 09                	jne    1014ec <serial_putc_sub+0x49>
  1014e3:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1014ea:	7e d0                	jle    1014bc <serial_putc_sub+0x19>
    }
    outb(COM1 + COM_TX, c);
  1014ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1014ef:	0f b6 c0             	movzbl %al,%eax
  1014f2:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1014f8:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1014fb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1014ff:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101503:	ee                   	out    %al,(%dx)
}
  101504:	90                   	nop
  101505:	c9                   	leave  
  101506:	c3                   	ret    

00101507 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101507:	55                   	push   %ebp
  101508:	89 e5                	mov    %esp,%ebp
  10150a:	e8 6d ed ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  10150f:	05 41 d4 00 00       	add    $0xd441,%eax
    if (c != '\b') {
  101514:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101518:	74 0d                	je     101527 <serial_putc+0x20>
        serial_putc_sub(c);
  10151a:	ff 75 08             	pushl  0x8(%ebp)
  10151d:	e8 81 ff ff ff       	call   1014a3 <serial_putc_sub>
  101522:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101525:	eb 1e                	jmp    101545 <serial_putc+0x3e>
        serial_putc_sub('\b');
  101527:	6a 08                	push   $0x8
  101529:	e8 75 ff ff ff       	call   1014a3 <serial_putc_sub>
  10152e:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  101531:	6a 20                	push   $0x20
  101533:	e8 6b ff ff ff       	call   1014a3 <serial_putc_sub>
  101538:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  10153b:	6a 08                	push   $0x8
  10153d:	e8 61 ff ff ff       	call   1014a3 <serial_putc_sub>
  101542:	83 c4 04             	add    $0x4,%esp
}
  101545:	90                   	nop
  101546:	c9                   	leave  
  101547:	c3                   	ret    

00101548 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101548:	55                   	push   %ebp
  101549:	89 e5                	mov    %esp,%ebp
  10154b:	53                   	push   %ebx
  10154c:	83 ec 14             	sub    $0x14,%esp
  10154f:	e8 2c ed ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  101554:	81 c3 fc d3 00 00    	add    $0xd3fc,%ebx
    int c;
    while ((c = (*proc)()) != -1) {
  10155a:	eb 36                	jmp    101592 <cons_intr+0x4a>
        if (c != 0) {
  10155c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101560:	74 30                	je     101592 <cons_intr+0x4a>
            cons.buf[cons.wpos ++] = c;
  101562:	8b 83 d4 07 00 00    	mov    0x7d4(%ebx),%eax
  101568:	8d 50 01             	lea    0x1(%eax),%edx
  10156b:	89 93 d4 07 00 00    	mov    %edx,0x7d4(%ebx)
  101571:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101574:	88 94 03 d0 05 00 00 	mov    %dl,0x5d0(%ebx,%eax,1)
            if (cons.wpos == CONSBUFSIZE) {
  10157b:	8b 83 d4 07 00 00    	mov    0x7d4(%ebx),%eax
  101581:	3d 00 02 00 00       	cmp    $0x200,%eax
  101586:	75 0a                	jne    101592 <cons_intr+0x4a>
                cons.wpos = 0;
  101588:	c7 83 d4 07 00 00 00 	movl   $0x0,0x7d4(%ebx)
  10158f:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101592:	8b 45 08             	mov    0x8(%ebp),%eax
  101595:	ff d0                	call   *%eax
  101597:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10159a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10159e:	75 bc                	jne    10155c <cons_intr+0x14>
            }
        }
    }
}
  1015a0:	90                   	nop
  1015a1:	83 c4 14             	add    $0x14,%esp
  1015a4:	5b                   	pop    %ebx
  1015a5:	5d                   	pop    %ebp
  1015a6:	c3                   	ret    

001015a7 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1015a7:	55                   	push   %ebp
  1015a8:	89 e5                	mov    %esp,%ebp
  1015aa:	83 ec 10             	sub    $0x10,%esp
  1015ad:	e8 ca ec ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1015b2:	05 9e d3 00 00       	add    $0xd39e,%eax
  1015b7:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1015bd:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1015c1:	89 c2                	mov    %eax,%edx
  1015c3:	ec                   	in     (%dx),%al
  1015c4:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1015c7:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1015cb:	0f b6 c0             	movzbl %al,%eax
  1015ce:	83 e0 01             	and    $0x1,%eax
  1015d1:	85 c0                	test   %eax,%eax
  1015d3:	75 07                	jne    1015dc <serial_proc_data+0x35>
        return -1;
  1015d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1015da:	eb 2a                	jmp    101606 <serial_proc_data+0x5f>
  1015dc:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1015e2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1015e6:	89 c2                	mov    %eax,%edx
  1015e8:	ec                   	in     (%dx),%al
  1015e9:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1015ec:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1015f0:	0f b6 c0             	movzbl %al,%eax
  1015f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1015f6:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1015fa:	75 07                	jne    101603 <serial_proc_data+0x5c>
        c = '\b';
  1015fc:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101603:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101606:	c9                   	leave  
  101607:	c3                   	ret    

00101608 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101608:	55                   	push   %ebp
  101609:	89 e5                	mov    %esp,%ebp
  10160b:	83 ec 08             	sub    $0x8,%esp
  10160e:	e8 69 ec ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101613:	05 3d d3 00 00       	add    $0xd33d,%eax
    if (serial_exists) {
  101618:	8b 90 b8 05 00 00    	mov    0x5b8(%eax),%edx
  10161e:	85 d2                	test   %edx,%edx
  101620:	74 12                	je     101634 <serial_intr+0x2c>
        cons_intr(serial_proc_data);
  101622:	83 ec 0c             	sub    $0xc,%esp
  101625:	8d 80 57 2c ff ff    	lea    -0xd3a9(%eax),%eax
  10162b:	50                   	push   %eax
  10162c:	e8 17 ff ff ff       	call   101548 <cons_intr>
  101631:	83 c4 10             	add    $0x10,%esp
    }
}
  101634:	90                   	nop
  101635:	c9                   	leave  
  101636:	c3                   	ret    

00101637 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101637:	55                   	push   %ebp
  101638:	89 e5                	mov    %esp,%ebp
  10163a:	53                   	push   %ebx
  10163b:	83 ec 24             	sub    $0x24,%esp
  10163e:	e8 e2 02 00 00       	call   101925 <__x86.get_pc_thunk.cx>
  101643:	81 c1 0d d3 00 00    	add    $0xd30d,%ecx
  101649:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10164f:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  101653:	89 c2                	mov    %eax,%edx
  101655:	ec                   	in     (%dx),%al
  101656:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101659:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10165d:	0f b6 c0             	movzbl %al,%eax
  101660:	83 e0 01             	and    $0x1,%eax
  101663:	85 c0                	test   %eax,%eax
  101665:	75 0a                	jne    101671 <kbd_proc_data+0x3a>
        return -1;
  101667:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10166c:	e9 73 01 00 00       	jmp    1017e4 <kbd_proc_data+0x1ad>
  101671:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101677:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10167b:	89 c2                	mov    %eax,%edx
  10167d:	ec                   	in     (%dx),%al
  10167e:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101681:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101685:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101688:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10168c:	75 19                	jne    1016a7 <kbd_proc_data+0x70>
        // E0 escape character
        shift |= E0ESC;
  10168e:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101694:	83 c8 40             	or     $0x40,%eax
  101697:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
        return 0;
  10169d:	b8 00 00 00 00       	mov    $0x0,%eax
  1016a2:	e9 3d 01 00 00       	jmp    1017e4 <kbd_proc_data+0x1ad>
    } else if (data & 0x80) {
  1016a7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1016ab:	84 c0                	test   %al,%al
  1016ad:	79 4b                	jns    1016fa <kbd_proc_data+0xc3>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1016af:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  1016b5:	83 e0 40             	and    $0x40,%eax
  1016b8:	85 c0                	test   %eax,%eax
  1016ba:	75 09                	jne    1016c5 <kbd_proc_data+0x8e>
  1016bc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1016c0:	83 e0 7f             	and    $0x7f,%eax
  1016c3:	eb 04                	jmp    1016c9 <kbd_proc_data+0x92>
  1016c5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1016c9:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1016cc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1016d0:	0f b6 84 01 b0 f6 ff 	movzbl -0x950(%ecx,%eax,1),%eax
  1016d7:	ff 
  1016d8:	83 c8 40             	or     $0x40,%eax
  1016db:	0f b6 c0             	movzbl %al,%eax
  1016de:	f7 d0                	not    %eax
  1016e0:	89 c2                	mov    %eax,%edx
  1016e2:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  1016e8:	21 d0                	and    %edx,%eax
  1016ea:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
        return 0;
  1016f0:	b8 00 00 00 00       	mov    $0x0,%eax
  1016f5:	e9 ea 00 00 00       	jmp    1017e4 <kbd_proc_data+0x1ad>
    } else if (shift & E0ESC) {
  1016fa:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101700:	83 e0 40             	and    $0x40,%eax
  101703:	85 c0                	test   %eax,%eax
  101705:	74 13                	je     10171a <kbd_proc_data+0xe3>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101707:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10170b:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101711:	83 e0 bf             	and    $0xffffffbf,%eax
  101714:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
    }

    shift |= shiftcode[data];
  10171a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10171e:	0f b6 84 01 b0 f6 ff 	movzbl -0x950(%ecx,%eax,1),%eax
  101725:	ff 
  101726:	0f b6 d0             	movzbl %al,%edx
  101729:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  10172f:	09 d0                	or     %edx,%eax
  101731:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)
    shift ^= togglecode[data];
  101737:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10173b:	0f b6 84 01 b0 f7 ff 	movzbl -0x850(%ecx,%eax,1),%eax
  101742:	ff 
  101743:	0f b6 d0             	movzbl %al,%edx
  101746:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  10174c:	31 d0                	xor    %edx,%eax
  10174e:	89 81 d8 07 00 00    	mov    %eax,0x7d8(%ecx)

    c = charcode[shift & (CTL | SHIFT)][data];
  101754:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  10175a:	83 e0 03             	and    $0x3,%eax
  10175d:	8b 94 81 34 00 00 00 	mov    0x34(%ecx,%eax,4),%edx
  101764:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101768:	01 d0                	add    %edx,%eax
  10176a:	0f b6 00             	movzbl (%eax),%eax
  10176d:	0f b6 c0             	movzbl %al,%eax
  101770:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101773:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  101779:	83 e0 08             	and    $0x8,%eax
  10177c:	85 c0                	test   %eax,%eax
  10177e:	74 22                	je     1017a2 <kbd_proc_data+0x16b>
        if ('a' <= c && c <= 'z')
  101780:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101784:	7e 0c                	jle    101792 <kbd_proc_data+0x15b>
  101786:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10178a:	7f 06                	jg     101792 <kbd_proc_data+0x15b>
            c += 'A' - 'a';
  10178c:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101790:	eb 10                	jmp    1017a2 <kbd_proc_data+0x16b>
        else if ('A' <= c && c <= 'Z')
  101792:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101796:	7e 0a                	jle    1017a2 <kbd_proc_data+0x16b>
  101798:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10179c:	7f 04                	jg     1017a2 <kbd_proc_data+0x16b>
            c += 'a' - 'A';
  10179e:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1017a2:	8b 81 d8 07 00 00    	mov    0x7d8(%ecx),%eax
  1017a8:	f7 d0                	not    %eax
  1017aa:	83 e0 06             	and    $0x6,%eax
  1017ad:	85 c0                	test   %eax,%eax
  1017af:	75 30                	jne    1017e1 <kbd_proc_data+0x1aa>
  1017b1:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1017b8:	75 27                	jne    1017e1 <kbd_proc_data+0x1aa>
        cprintf("Rebooting!\n");
  1017ba:	83 ec 0c             	sub    $0xc,%esp
  1017bd:	8d 81 61 51 ff ff    	lea    -0xae9f(%ecx),%eax
  1017c3:	50                   	push   %eax
  1017c4:	89 cb                	mov    %ecx,%ebx
  1017c6:	e8 28 eb ff ff       	call   1002f3 <cprintf>
  1017cb:	83 c4 10             	add    $0x10,%esp
  1017ce:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1017d4:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1017dc:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1017e0:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1017e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1017e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1017e7:	c9                   	leave  
  1017e8:	c3                   	ret    

001017e9 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1017e9:	55                   	push   %ebp
  1017ea:	89 e5                	mov    %esp,%ebp
  1017ec:	83 ec 08             	sub    $0x8,%esp
  1017ef:	e8 88 ea ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1017f4:	05 5c d1 00 00       	add    $0xd15c,%eax
    cons_intr(kbd_proc_data);
  1017f9:	83 ec 0c             	sub    $0xc,%esp
  1017fc:	8d 80 e7 2c ff ff    	lea    -0xd319(%eax),%eax
  101802:	50                   	push   %eax
  101803:	e8 40 fd ff ff       	call   101548 <cons_intr>
  101808:	83 c4 10             	add    $0x10,%esp
}
  10180b:	90                   	nop
  10180c:	c9                   	leave  
  10180d:	c3                   	ret    

0010180e <kbd_init>:

static void
kbd_init(void) {
  10180e:	55                   	push   %ebp
  10180f:	89 e5                	mov    %esp,%ebp
  101811:	53                   	push   %ebx
  101812:	83 ec 04             	sub    $0x4,%esp
  101815:	e8 66 ea ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  10181a:	81 c3 36 d1 00 00    	add    $0xd136,%ebx
    // drain the kbd buffer
    kbd_intr();
  101820:	e8 c4 ff ff ff       	call   1017e9 <kbd_intr>
    pic_enable(IRQ_KBD);
  101825:	83 ec 0c             	sub    $0xc,%esp
  101828:	6a 01                	push   $0x1
  10182a:	e8 5f 01 00 00       	call   10198e <pic_enable>
  10182f:	83 c4 10             	add    $0x10,%esp
}
  101832:	90                   	nop
  101833:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101836:	c9                   	leave  
  101837:	c3                   	ret    

00101838 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101838:	55                   	push   %ebp
  101839:	89 e5                	mov    %esp,%ebp
  10183b:	53                   	push   %ebx
  10183c:	83 ec 04             	sub    $0x4,%esp
  10183f:	e8 3c ea ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  101844:	81 c3 0c d1 00 00    	add    $0xd10c,%ebx
    cga_init();
  10184a:	e8 b4 f7 ff ff       	call   101003 <cga_init>
    serial_init();
  10184f:	e8 a3 f8 ff ff       	call   1010f7 <serial_init>
    kbd_init();
  101854:	e8 b5 ff ff ff       	call   10180e <kbd_init>
    if (!serial_exists) {
  101859:	8b 83 b8 05 00 00    	mov    0x5b8(%ebx),%eax
  10185f:	85 c0                	test   %eax,%eax
  101861:	75 12                	jne    101875 <cons_init+0x3d>
        cprintf("serial port does not exist!!\n");
  101863:	83 ec 0c             	sub    $0xc,%esp
  101866:	8d 83 6d 51 ff ff    	lea    -0xae93(%ebx),%eax
  10186c:	50                   	push   %eax
  10186d:	e8 81 ea ff ff       	call   1002f3 <cprintf>
  101872:	83 c4 10             	add    $0x10,%esp
    }
}
  101875:	90                   	nop
  101876:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101879:	c9                   	leave  
  10187a:	c3                   	ret    

0010187b <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10187b:	55                   	push   %ebp
  10187c:	89 e5                	mov    %esp,%ebp
  10187e:	83 ec 08             	sub    $0x8,%esp
  101881:	e8 f6 e9 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101886:	05 ca d0 00 00       	add    $0xd0ca,%eax
    lpt_putc(c);
  10188b:	ff 75 08             	pushl  0x8(%ebp)
  10188e:	e8 e0 f9 ff ff       	call   101273 <lpt_putc>
  101893:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  101896:	83 ec 0c             	sub    $0xc,%esp
  101899:	ff 75 08             	pushl  0x8(%ebp)
  10189c:	e8 13 fa ff ff       	call   1012b4 <cga_putc>
  1018a1:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  1018a4:	83 ec 0c             	sub    $0xc,%esp
  1018a7:	ff 75 08             	pushl  0x8(%ebp)
  1018aa:	e8 58 fc ff ff       	call   101507 <serial_putc>
  1018af:	83 c4 10             	add    $0x10,%esp
}
  1018b2:	90                   	nop
  1018b3:	c9                   	leave  
  1018b4:	c3                   	ret    

001018b5 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1018b5:	55                   	push   %ebp
  1018b6:	89 e5                	mov    %esp,%ebp
  1018b8:	53                   	push   %ebx
  1018b9:	83 ec 14             	sub    $0x14,%esp
  1018bc:	e8 bf e9 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  1018c1:	81 c3 8f d0 00 00    	add    $0xd08f,%ebx
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1018c7:	e8 3c fd ff ff       	call   101608 <serial_intr>
    kbd_intr();
  1018cc:	e8 18 ff ff ff       	call   1017e9 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1018d1:	8b 93 d0 07 00 00    	mov    0x7d0(%ebx),%edx
  1018d7:	8b 83 d4 07 00 00    	mov    0x7d4(%ebx),%eax
  1018dd:	39 c2                	cmp    %eax,%edx
  1018df:	74 39                	je     10191a <cons_getc+0x65>
        c = cons.buf[cons.rpos ++];
  1018e1:	8b 83 d0 07 00 00    	mov    0x7d0(%ebx),%eax
  1018e7:	8d 50 01             	lea    0x1(%eax),%edx
  1018ea:	89 93 d0 07 00 00    	mov    %edx,0x7d0(%ebx)
  1018f0:	0f b6 84 03 d0 05 00 	movzbl 0x5d0(%ebx,%eax,1),%eax
  1018f7:	00 
  1018f8:	0f b6 c0             	movzbl %al,%eax
  1018fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1018fe:	8b 83 d0 07 00 00    	mov    0x7d0(%ebx),%eax
  101904:	3d 00 02 00 00       	cmp    $0x200,%eax
  101909:	75 0a                	jne    101915 <cons_getc+0x60>
            cons.rpos = 0;
  10190b:	c7 83 d0 07 00 00 00 	movl   $0x0,0x7d0(%ebx)
  101912:	00 00 00 
        }
        return c;
  101915:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101918:	eb 05                	jmp    10191f <cons_getc+0x6a>
    }
    return 0;
  10191a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10191f:	83 c4 14             	add    $0x14,%esp
  101922:	5b                   	pop    %ebx
  101923:	5d                   	pop    %ebp
  101924:	c3                   	ret    

00101925 <__x86.get_pc_thunk.cx>:
  101925:	8b 0c 24             	mov    (%esp),%ecx
  101928:	c3                   	ret    

00101929 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101929:	55                   	push   %ebp
  10192a:	89 e5                	mov    %esp,%ebp
  10192c:	83 ec 14             	sub    $0x14,%esp
  10192f:	e8 48 e9 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101934:	05 1c d0 00 00       	add    $0xd01c,%eax
  101939:	8b 55 08             	mov    0x8(%ebp),%edx
  10193c:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
    irq_mask = mask;
  101940:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101944:	66 89 90 b0 fb ff ff 	mov    %dx,-0x450(%eax)
    if (did_init) {
  10194b:	8b 80 dc 07 00 00    	mov    0x7dc(%eax),%eax
  101951:	85 c0                	test   %eax,%eax
  101953:	74 36                	je     10198b <pic_setmask+0x62>
        outb(IO_PIC1 + 1, mask);
  101955:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101959:	0f b6 c0             	movzbl %al,%eax
  10195c:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101962:	88 45 f9             	mov    %al,-0x7(%ebp)
  101965:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101969:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10196d:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10196e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101972:	66 c1 e8 08          	shr    $0x8,%ax
  101976:	0f b6 c0             	movzbl %al,%eax
  101979:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10197f:	88 45 fd             	mov    %al,-0x3(%ebp)
  101982:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101986:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10198a:	ee                   	out    %al,(%dx)
    }
}
  10198b:	90                   	nop
  10198c:	c9                   	leave  
  10198d:	c3                   	ret    

0010198e <pic_enable>:

void
pic_enable(unsigned int irq) {
  10198e:	55                   	push   %ebp
  10198f:	89 e5                	mov    %esp,%ebp
  101991:	53                   	push   %ebx
  101992:	e8 e5 e8 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101997:	05 b9 cf 00 00       	add    $0xcfb9,%eax
    pic_setmask(irq_mask & ~(1 << irq));
  10199c:	8b 55 08             	mov    0x8(%ebp),%edx
  10199f:	bb 01 00 00 00       	mov    $0x1,%ebx
  1019a4:	89 d1                	mov    %edx,%ecx
  1019a6:	d3 e3                	shl    %cl,%ebx
  1019a8:	89 da                	mov    %ebx,%edx
  1019aa:	f7 d2                	not    %edx
  1019ac:	0f b7 80 b0 fb ff ff 	movzwl -0x450(%eax),%eax
  1019b3:	21 d0                	and    %edx,%eax
  1019b5:	0f b7 c0             	movzwl %ax,%eax
  1019b8:	50                   	push   %eax
  1019b9:	e8 6b ff ff ff       	call   101929 <pic_setmask>
  1019be:	83 c4 04             	add    $0x4,%esp
}
  1019c1:	90                   	nop
  1019c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1019c5:	c9                   	leave  
  1019c6:	c3                   	ret    

001019c7 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1019c7:	55                   	push   %ebp
  1019c8:	89 e5                	mov    %esp,%ebp
  1019ca:	83 ec 40             	sub    $0x40,%esp
  1019cd:	e8 53 ff ff ff       	call   101925 <__x86.get_pc_thunk.cx>
  1019d2:	81 c1 7e cf 00 00    	add    $0xcf7e,%ecx
    did_init = 1;
  1019d8:	c7 81 dc 07 00 00 01 	movl   $0x1,0x7dc(%ecx)
  1019df:	00 00 00 
  1019e2:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1019e8:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
  1019ec:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1019f0:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1019f4:	ee                   	out    %al,(%dx)
  1019f5:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1019fb:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
  1019ff:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101a03:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101a07:	ee                   	out    %al,(%dx)
  101a08:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101a0e:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
  101a12:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101a16:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101a1a:	ee                   	out    %al,(%dx)
  101a1b:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101a21:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
  101a25:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101a29:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101a2d:	ee                   	out    %al,(%dx)
  101a2e:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101a34:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
  101a38:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101a3c:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101a40:	ee                   	out    %al,(%dx)
  101a41:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101a47:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
  101a4b:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101a4f:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101a53:	ee                   	out    %al,(%dx)
  101a54:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101a5a:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
  101a5e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101a62:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101a66:	ee                   	out    %al,(%dx)
  101a67:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101a6d:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
  101a71:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101a75:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101a79:	ee                   	out    %al,(%dx)
  101a7a:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101a80:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
  101a84:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101a88:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101a8c:	ee                   	out    %al,(%dx)
  101a8d:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101a93:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
  101a97:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101a9b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101a9f:	ee                   	out    %al,(%dx)
  101aa0:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101aa6:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
  101aaa:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101aae:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101ab2:	ee                   	out    %al,(%dx)
  101ab3:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101ab9:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
  101abd:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101ac1:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101ac5:	ee                   	out    %al,(%dx)
  101ac6:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101acc:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
  101ad0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101ad4:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101ad8:	ee                   	out    %al,(%dx)
  101ad9:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101adf:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
  101ae3:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101ae7:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101aeb:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101aec:	0f b7 81 b0 fb ff ff 	movzwl -0x450(%ecx),%eax
  101af3:	66 83 f8 ff          	cmp    $0xffff,%ax
  101af7:	74 13                	je     101b0c <pic_init+0x145>
        pic_setmask(irq_mask);
  101af9:	0f b7 81 b0 fb ff ff 	movzwl -0x450(%ecx),%eax
  101b00:	0f b7 c0             	movzwl %ax,%eax
  101b03:	50                   	push   %eax
  101b04:	e8 20 fe ff ff       	call   101929 <pic_setmask>
  101b09:	83 c4 04             	add    $0x4,%esp
    }
}
  101b0c:	90                   	nop
  101b0d:	c9                   	leave  
  101b0e:	c3                   	ret    

00101b0f <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101b0f:	55                   	push   %ebp
  101b10:	89 e5                	mov    %esp,%ebp
  101b12:	e8 65 e7 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101b17:	05 39 ce 00 00       	add    $0xce39,%eax
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101b1c:	fb                   	sti    
    sti();
}
  101b1d:	90                   	nop
  101b1e:	5d                   	pop    %ebp
  101b1f:	c3                   	ret    

00101b20 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101b20:	55                   	push   %ebp
  101b21:	89 e5                	mov    %esp,%ebp
  101b23:	e8 54 e7 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101b28:	05 28 ce 00 00       	add    $0xce28,%eax
}

static inline void
cli(void) {
    asm volatile ("cli");
  101b2d:	fa                   	cli    
    cli();
}
  101b2e:	90                   	nop
  101b2f:	5d                   	pop    %ebp
  101b30:	c3                   	ret    

00101b31 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101b31:	55                   	push   %ebp
  101b32:	89 e5                	mov    %esp,%ebp
  101b34:	53                   	push   %ebx
  101b35:	83 ec 04             	sub    $0x4,%esp
  101b38:	e8 3f e7 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101b3d:	05 13 ce 00 00       	add    $0xce13,%eax
    cprintf("%d ticks\n",TICK_NUM);
  101b42:	83 ec 08             	sub    $0x8,%esp
  101b45:	6a 64                	push   $0x64
  101b47:	8d 90 8b 51 ff ff    	lea    -0xae75(%eax),%edx
  101b4d:	52                   	push   %edx
  101b4e:	89 c3                	mov    %eax,%ebx
  101b50:	e8 9e e7 ff ff       	call   1002f3 <cprintf>
  101b55:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101b58:	90                   	nop
  101b59:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101b5c:	c9                   	leave  
  101b5d:	c3                   	ret    

00101b5e <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101b5e:	55                   	push   %ebp
  101b5f:	89 e5                	mov    %esp,%ebp
  101b61:	e8 16 e7 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101b66:	05 ea cd 00 00       	add    $0xcdea,%eax
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101b6b:	90                   	nop
  101b6c:	5d                   	pop    %ebp
  101b6d:	c3                   	ret    

00101b6e <trapname>:

static const char *
trapname(int trapno) {
  101b6e:	55                   	push   %ebp
  101b6f:	89 e5                	mov    %esp,%ebp
  101b71:	e8 06 e7 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101b76:	05 da cd 00 00       	add    $0xcdda,%eax
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101b7b:	8b 55 08             	mov    0x8(%ebp),%edx
  101b7e:	83 fa 13             	cmp    $0x13,%edx
  101b81:	77 0c                	ja     101b8f <trapname+0x21>
        return excnames[trapno];
  101b83:	8b 55 08             	mov    0x8(%ebp),%edx
  101b86:	8b 84 90 f0 00 00 00 	mov    0xf0(%eax,%edx,4),%eax
  101b8d:	eb 1a                	jmp    101ba9 <trapname+0x3b>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101b8f:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101b93:	7e 0e                	jle    101ba3 <trapname+0x35>
  101b95:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101b99:	7f 08                	jg     101ba3 <trapname+0x35>
        return "Hardware Interrupt";
  101b9b:	8d 80 95 51 ff ff    	lea    -0xae6b(%eax),%eax
  101ba1:	eb 06                	jmp    101ba9 <trapname+0x3b>
    }
    return "(unknown trap)";
  101ba3:	8d 80 a8 51 ff ff    	lea    -0xae58(%eax),%eax
}
  101ba9:	5d                   	pop    %ebp
  101baa:	c3                   	ret    

00101bab <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101bab:	55                   	push   %ebp
  101bac:	89 e5                	mov    %esp,%ebp
  101bae:	e8 c9 e6 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101bb3:	05 9d cd 00 00       	add    $0xcd9d,%eax
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101bb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bbf:	66 83 f8 08          	cmp    $0x8,%ax
  101bc3:	0f 94 c0             	sete   %al
  101bc6:	0f b6 c0             	movzbl %al,%eax
}
  101bc9:	5d                   	pop    %ebp
  101bca:	c3                   	ret    

00101bcb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101bcb:	55                   	push   %ebp
  101bcc:	89 e5                	mov    %esp,%ebp
  101bce:	53                   	push   %ebx
  101bcf:	83 ec 14             	sub    $0x14,%esp
  101bd2:	e8 a9 e6 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  101bd7:	81 c3 79 cd 00 00    	add    $0xcd79,%ebx
    cprintf("trapframe at %p\n", tf);
  101bdd:	83 ec 08             	sub    $0x8,%esp
  101be0:	ff 75 08             	pushl  0x8(%ebp)
  101be3:	8d 83 e9 51 ff ff    	lea    -0xae17(%ebx),%eax
  101be9:	50                   	push   %eax
  101bea:	e8 04 e7 ff ff       	call   1002f3 <cprintf>
  101bef:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf5:	83 ec 0c             	sub    $0xc,%esp
  101bf8:	50                   	push   %eax
  101bf9:	e8 d3 01 00 00       	call   101dd1 <print_regs>
  101bfe:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101c01:	8b 45 08             	mov    0x8(%ebp),%eax
  101c04:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101c08:	0f b7 c0             	movzwl %ax,%eax
  101c0b:	83 ec 08             	sub    $0x8,%esp
  101c0e:	50                   	push   %eax
  101c0f:	8d 83 fa 51 ff ff    	lea    -0xae06(%ebx),%eax
  101c15:	50                   	push   %eax
  101c16:	e8 d8 e6 ff ff       	call   1002f3 <cprintf>
  101c1b:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101c1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c21:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101c25:	0f b7 c0             	movzwl %ax,%eax
  101c28:	83 ec 08             	sub    $0x8,%esp
  101c2b:	50                   	push   %eax
  101c2c:	8d 83 0d 52 ff ff    	lea    -0xadf3(%ebx),%eax
  101c32:	50                   	push   %eax
  101c33:	e8 bb e6 ff ff       	call   1002f3 <cprintf>
  101c38:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101c3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3e:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101c42:	0f b7 c0             	movzwl %ax,%eax
  101c45:	83 ec 08             	sub    $0x8,%esp
  101c48:	50                   	push   %eax
  101c49:	8d 83 20 52 ff ff    	lea    -0xade0(%ebx),%eax
  101c4f:	50                   	push   %eax
  101c50:	e8 9e e6 ff ff       	call   1002f3 <cprintf>
  101c55:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101c58:	8b 45 08             	mov    0x8(%ebp),%eax
  101c5b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101c5f:	0f b7 c0             	movzwl %ax,%eax
  101c62:	83 ec 08             	sub    $0x8,%esp
  101c65:	50                   	push   %eax
  101c66:	8d 83 33 52 ff ff    	lea    -0xadcd(%ebx),%eax
  101c6c:	50                   	push   %eax
  101c6d:	e8 81 e6 ff ff       	call   1002f3 <cprintf>
  101c72:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101c75:	8b 45 08             	mov    0x8(%ebp),%eax
  101c78:	8b 40 30             	mov    0x30(%eax),%eax
  101c7b:	83 ec 0c             	sub    $0xc,%esp
  101c7e:	50                   	push   %eax
  101c7f:	e8 ea fe ff ff       	call   101b6e <trapname>
  101c84:	83 c4 10             	add    $0x10,%esp
  101c87:	89 c2                	mov    %eax,%edx
  101c89:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8c:	8b 40 30             	mov    0x30(%eax),%eax
  101c8f:	83 ec 04             	sub    $0x4,%esp
  101c92:	52                   	push   %edx
  101c93:	50                   	push   %eax
  101c94:	8d 83 46 52 ff ff    	lea    -0xadba(%ebx),%eax
  101c9a:	50                   	push   %eax
  101c9b:	e8 53 e6 ff ff       	call   1002f3 <cprintf>
  101ca0:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101ca3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca6:	8b 40 34             	mov    0x34(%eax),%eax
  101ca9:	83 ec 08             	sub    $0x8,%esp
  101cac:	50                   	push   %eax
  101cad:	8d 83 58 52 ff ff    	lea    -0xada8(%ebx),%eax
  101cb3:	50                   	push   %eax
  101cb4:	e8 3a e6 ff ff       	call   1002f3 <cprintf>
  101cb9:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101cbc:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbf:	8b 40 38             	mov    0x38(%eax),%eax
  101cc2:	83 ec 08             	sub    $0x8,%esp
  101cc5:	50                   	push   %eax
  101cc6:	8d 83 67 52 ff ff    	lea    -0xad99(%ebx),%eax
  101ccc:	50                   	push   %eax
  101ccd:	e8 21 e6 ff ff       	call   1002f3 <cprintf>
  101cd2:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101cd5:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd8:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101cdc:	0f b7 c0             	movzwl %ax,%eax
  101cdf:	83 ec 08             	sub    $0x8,%esp
  101ce2:	50                   	push   %eax
  101ce3:	8d 83 76 52 ff ff    	lea    -0xad8a(%ebx),%eax
  101ce9:	50                   	push   %eax
  101cea:	e8 04 e6 ff ff       	call   1002f3 <cprintf>
  101cef:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101cf2:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf5:	8b 40 40             	mov    0x40(%eax),%eax
  101cf8:	83 ec 08             	sub    $0x8,%esp
  101cfb:	50                   	push   %eax
  101cfc:	8d 83 89 52 ff ff    	lea    -0xad77(%ebx),%eax
  101d02:	50                   	push   %eax
  101d03:	e8 eb e5 ff ff       	call   1002f3 <cprintf>
  101d08:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101d0b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101d12:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101d19:	eb 41                	jmp    101d5c <print_trapframe+0x191>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d1e:	8b 50 40             	mov    0x40(%eax),%edx
  101d21:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101d24:	21 d0                	and    %edx,%eax
  101d26:	85 c0                	test   %eax,%eax
  101d28:	74 2b                	je     101d55 <print_trapframe+0x18a>
  101d2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101d2d:	8b 84 83 70 00 00 00 	mov    0x70(%ebx,%eax,4),%eax
  101d34:	85 c0                	test   %eax,%eax
  101d36:	74 1d                	je     101d55 <print_trapframe+0x18a>
            cprintf("%s,", IA32flags[i]);
  101d38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101d3b:	8b 84 83 70 00 00 00 	mov    0x70(%ebx,%eax,4),%eax
  101d42:	83 ec 08             	sub    $0x8,%esp
  101d45:	50                   	push   %eax
  101d46:	8d 83 98 52 ff ff    	lea    -0xad68(%ebx),%eax
  101d4c:	50                   	push   %eax
  101d4d:	e8 a1 e5 ff ff       	call   1002f3 <cprintf>
  101d52:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101d55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101d59:	d1 65 f0             	shll   -0x10(%ebp)
  101d5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101d5f:	83 f8 17             	cmp    $0x17,%eax
  101d62:	76 b7                	jbe    101d1b <print_trapframe+0x150>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101d64:	8b 45 08             	mov    0x8(%ebp),%eax
  101d67:	8b 40 40             	mov    0x40(%eax),%eax
  101d6a:	c1 e8 0c             	shr    $0xc,%eax
  101d6d:	83 e0 03             	and    $0x3,%eax
  101d70:	83 ec 08             	sub    $0x8,%esp
  101d73:	50                   	push   %eax
  101d74:	8d 83 9c 52 ff ff    	lea    -0xad64(%ebx),%eax
  101d7a:	50                   	push   %eax
  101d7b:	e8 73 e5 ff ff       	call   1002f3 <cprintf>
  101d80:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101d83:	83 ec 0c             	sub    $0xc,%esp
  101d86:	ff 75 08             	pushl  0x8(%ebp)
  101d89:	e8 1d fe ff ff       	call   101bab <trap_in_kernel>
  101d8e:	83 c4 10             	add    $0x10,%esp
  101d91:	85 c0                	test   %eax,%eax
  101d93:	75 36                	jne    101dcb <print_trapframe+0x200>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101d95:	8b 45 08             	mov    0x8(%ebp),%eax
  101d98:	8b 40 44             	mov    0x44(%eax),%eax
  101d9b:	83 ec 08             	sub    $0x8,%esp
  101d9e:	50                   	push   %eax
  101d9f:	8d 83 a5 52 ff ff    	lea    -0xad5b(%ebx),%eax
  101da5:	50                   	push   %eax
  101da6:	e8 48 e5 ff ff       	call   1002f3 <cprintf>
  101dab:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101dae:	8b 45 08             	mov    0x8(%ebp),%eax
  101db1:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101db5:	0f b7 c0             	movzwl %ax,%eax
  101db8:	83 ec 08             	sub    $0x8,%esp
  101dbb:	50                   	push   %eax
  101dbc:	8d 83 b4 52 ff ff    	lea    -0xad4c(%ebx),%eax
  101dc2:	50                   	push   %eax
  101dc3:	e8 2b e5 ff ff       	call   1002f3 <cprintf>
  101dc8:	83 c4 10             	add    $0x10,%esp
    }
}
  101dcb:	90                   	nop
  101dcc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101dcf:	c9                   	leave  
  101dd0:	c3                   	ret    

00101dd1 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101dd1:	55                   	push   %ebp
  101dd2:	89 e5                	mov    %esp,%ebp
  101dd4:	53                   	push   %ebx
  101dd5:	83 ec 04             	sub    $0x4,%esp
  101dd8:	e8 a3 e4 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  101ddd:	81 c3 73 cb 00 00    	add    $0xcb73,%ebx
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101de3:	8b 45 08             	mov    0x8(%ebp),%eax
  101de6:	8b 00                	mov    (%eax),%eax
  101de8:	83 ec 08             	sub    $0x8,%esp
  101deb:	50                   	push   %eax
  101dec:	8d 83 c7 52 ff ff    	lea    -0xad39(%ebx),%eax
  101df2:	50                   	push   %eax
  101df3:	e8 fb e4 ff ff       	call   1002f3 <cprintf>
  101df8:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101dfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfe:	8b 40 04             	mov    0x4(%eax),%eax
  101e01:	83 ec 08             	sub    $0x8,%esp
  101e04:	50                   	push   %eax
  101e05:	8d 83 d6 52 ff ff    	lea    -0xad2a(%ebx),%eax
  101e0b:	50                   	push   %eax
  101e0c:	e8 e2 e4 ff ff       	call   1002f3 <cprintf>
  101e11:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101e14:	8b 45 08             	mov    0x8(%ebp),%eax
  101e17:	8b 40 08             	mov    0x8(%eax),%eax
  101e1a:	83 ec 08             	sub    $0x8,%esp
  101e1d:	50                   	push   %eax
  101e1e:	8d 83 e5 52 ff ff    	lea    -0xad1b(%ebx),%eax
  101e24:	50                   	push   %eax
  101e25:	e8 c9 e4 ff ff       	call   1002f3 <cprintf>
  101e2a:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101e2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e30:	8b 40 0c             	mov    0xc(%eax),%eax
  101e33:	83 ec 08             	sub    $0x8,%esp
  101e36:	50                   	push   %eax
  101e37:	8d 83 f4 52 ff ff    	lea    -0xad0c(%ebx),%eax
  101e3d:	50                   	push   %eax
  101e3e:	e8 b0 e4 ff ff       	call   1002f3 <cprintf>
  101e43:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101e46:	8b 45 08             	mov    0x8(%ebp),%eax
  101e49:	8b 40 10             	mov    0x10(%eax),%eax
  101e4c:	83 ec 08             	sub    $0x8,%esp
  101e4f:	50                   	push   %eax
  101e50:	8d 83 03 53 ff ff    	lea    -0xacfd(%ebx),%eax
  101e56:	50                   	push   %eax
  101e57:	e8 97 e4 ff ff       	call   1002f3 <cprintf>
  101e5c:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101e5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e62:	8b 40 14             	mov    0x14(%eax),%eax
  101e65:	83 ec 08             	sub    $0x8,%esp
  101e68:	50                   	push   %eax
  101e69:	8d 83 12 53 ff ff    	lea    -0xacee(%ebx),%eax
  101e6f:	50                   	push   %eax
  101e70:	e8 7e e4 ff ff       	call   1002f3 <cprintf>
  101e75:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101e78:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7b:	8b 40 18             	mov    0x18(%eax),%eax
  101e7e:	83 ec 08             	sub    $0x8,%esp
  101e81:	50                   	push   %eax
  101e82:	8d 83 21 53 ff ff    	lea    -0xacdf(%ebx),%eax
  101e88:	50                   	push   %eax
  101e89:	e8 65 e4 ff ff       	call   1002f3 <cprintf>
  101e8e:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101e91:	8b 45 08             	mov    0x8(%ebp),%eax
  101e94:	8b 40 1c             	mov    0x1c(%eax),%eax
  101e97:	83 ec 08             	sub    $0x8,%esp
  101e9a:	50                   	push   %eax
  101e9b:	8d 83 30 53 ff ff    	lea    -0xacd0(%ebx),%eax
  101ea1:	50                   	push   %eax
  101ea2:	e8 4c e4 ff ff       	call   1002f3 <cprintf>
  101ea7:	83 c4 10             	add    $0x10,%esp
}
  101eaa:	90                   	nop
  101eab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101eae:	c9                   	leave  
  101eaf:	c3                   	ret    

00101eb0 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101eb0:	55                   	push   %ebp
  101eb1:	89 e5                	mov    %esp,%ebp
  101eb3:	53                   	push   %ebx
  101eb4:	83 ec 14             	sub    $0x14,%esp
  101eb7:	e8 c4 e3 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  101ebc:	81 c3 94 ca 00 00    	add    $0xca94,%ebx
    char c;

    switch (tf->tf_trapno) {
  101ec2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec5:	8b 40 30             	mov    0x30(%eax),%eax
  101ec8:	83 f8 2f             	cmp    $0x2f,%eax
  101ecb:	77 1e                	ja     101eeb <trap_dispatch+0x3b>
  101ecd:	83 f8 2e             	cmp    $0x2e,%eax
  101ed0:	0f 83 c0 00 00 00    	jae    101f96 <trap_dispatch+0xe6>
  101ed6:	83 f8 21             	cmp    $0x21,%eax
  101ed9:	74 40                	je     101f1b <trap_dispatch+0x6b>
  101edb:	83 f8 24             	cmp    $0x24,%eax
  101ede:	74 15                	je     101ef5 <trap_dispatch+0x45>
  101ee0:	83 f8 20             	cmp    $0x20,%eax
  101ee3:	0f 84 b0 00 00 00    	je     101f99 <trap_dispatch+0xe9>
  101ee9:	eb 71                	jmp    101f5c <trap_dispatch+0xac>
  101eeb:	83 e8 78             	sub    $0x78,%eax
  101eee:	83 f8 01             	cmp    $0x1,%eax
  101ef1:	77 69                	ja     101f5c <trap_dispatch+0xac>
  101ef3:	eb 4c                	jmp    101f41 <trap_dispatch+0x91>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101ef5:	e8 bb f9 ff ff       	call   1018b5 <cons_getc>
  101efa:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101efd:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101f01:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101f05:	83 ec 04             	sub    $0x4,%esp
  101f08:	52                   	push   %edx
  101f09:	50                   	push   %eax
  101f0a:	8d 83 3f 53 ff ff    	lea    -0xacc1(%ebx),%eax
  101f10:	50                   	push   %eax
  101f11:	e8 dd e3 ff ff       	call   1002f3 <cprintf>
  101f16:	83 c4 10             	add    $0x10,%esp
        break;
  101f19:	eb 7f                	jmp    101f9a <trap_dispatch+0xea>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101f1b:	e8 95 f9 ff ff       	call   1018b5 <cons_getc>
  101f20:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101f23:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101f27:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101f2b:	83 ec 04             	sub    $0x4,%esp
  101f2e:	52                   	push   %edx
  101f2f:	50                   	push   %eax
  101f30:	8d 83 51 53 ff ff    	lea    -0xacaf(%ebx),%eax
  101f36:	50                   	push   %eax
  101f37:	e8 b7 e3 ff ff       	call   1002f3 <cprintf>
  101f3c:	83 c4 10             	add    $0x10,%esp
        break;
  101f3f:	eb 59                	jmp    101f9a <trap_dispatch+0xea>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101f41:	83 ec 04             	sub    $0x4,%esp
  101f44:	8d 83 60 53 ff ff    	lea    -0xaca0(%ebx),%eax
  101f4a:	50                   	push   %eax
  101f4b:	68 a2 00 00 00       	push   $0xa2
  101f50:	8d 83 70 53 ff ff    	lea    -0xac90(%ebx),%eax
  101f56:	50                   	push   %eax
  101f57:	e8 47 e5 ff ff       	call   1004a3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101f5c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f63:	0f b7 c0             	movzwl %ax,%eax
  101f66:	83 e0 03             	and    $0x3,%eax
  101f69:	85 c0                	test   %eax,%eax
  101f6b:	75 2d                	jne    101f9a <trap_dispatch+0xea>
            print_trapframe(tf);
  101f6d:	83 ec 0c             	sub    $0xc,%esp
  101f70:	ff 75 08             	pushl  0x8(%ebp)
  101f73:	e8 53 fc ff ff       	call   101bcb <print_trapframe>
  101f78:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101f7b:	83 ec 04             	sub    $0x4,%esp
  101f7e:	8d 83 81 53 ff ff    	lea    -0xac7f(%ebx),%eax
  101f84:	50                   	push   %eax
  101f85:	68 ac 00 00 00       	push   $0xac
  101f8a:	8d 83 70 53 ff ff    	lea    -0xac90(%ebx),%eax
  101f90:	50                   	push   %eax
  101f91:	e8 0d e5 ff ff       	call   1004a3 <__panic>
        break;
  101f96:	90                   	nop
  101f97:	eb 01                	jmp    101f9a <trap_dispatch+0xea>
        break;
  101f99:	90                   	nop
        }
    }
}
  101f9a:	90                   	nop
  101f9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101f9e:	c9                   	leave  
  101f9f:	c3                   	ret    

00101fa0 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101fa0:	55                   	push   %ebp
  101fa1:	89 e5                	mov    %esp,%ebp
  101fa3:	83 ec 08             	sub    $0x8,%esp
  101fa6:	e8 d1 e2 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  101fab:	05 a5 c9 00 00       	add    $0xc9a5,%eax
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101fb0:	83 ec 0c             	sub    $0xc,%esp
  101fb3:	ff 75 08             	pushl  0x8(%ebp)
  101fb6:	e8 f5 fe ff ff       	call   101eb0 <trap_dispatch>
  101fbb:	83 c4 10             	add    $0x10,%esp
}
  101fbe:	90                   	nop
  101fbf:	c9                   	leave  
  101fc0:	c3                   	ret    

00101fc1 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $0
  101fc3:	6a 00                	push   $0x0
  jmp __alltraps
  101fc5:	e9 67 0a 00 00       	jmp    102a31 <__alltraps>

00101fca <vector1>:
.globl vector1
vector1:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $1
  101fcc:	6a 01                	push   $0x1
  jmp __alltraps
  101fce:	e9 5e 0a 00 00       	jmp    102a31 <__alltraps>

00101fd3 <vector2>:
.globl vector2
vector2:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $2
  101fd5:	6a 02                	push   $0x2
  jmp __alltraps
  101fd7:	e9 55 0a 00 00       	jmp    102a31 <__alltraps>

00101fdc <vector3>:
.globl vector3
vector3:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $3
  101fde:	6a 03                	push   $0x3
  jmp __alltraps
  101fe0:	e9 4c 0a 00 00       	jmp    102a31 <__alltraps>

00101fe5 <vector4>:
.globl vector4
vector4:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $4
  101fe7:	6a 04                	push   $0x4
  jmp __alltraps
  101fe9:	e9 43 0a 00 00       	jmp    102a31 <__alltraps>

00101fee <vector5>:
.globl vector5
vector5:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $5
  101ff0:	6a 05                	push   $0x5
  jmp __alltraps
  101ff2:	e9 3a 0a 00 00       	jmp    102a31 <__alltraps>

00101ff7 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $6
  101ff9:	6a 06                	push   $0x6
  jmp __alltraps
  101ffb:	e9 31 0a 00 00       	jmp    102a31 <__alltraps>

00102000 <vector7>:
.globl vector7
vector7:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $7
  102002:	6a 07                	push   $0x7
  jmp __alltraps
  102004:	e9 28 0a 00 00       	jmp    102a31 <__alltraps>

00102009 <vector8>:
.globl vector8
vector8:
  pushl $8
  102009:	6a 08                	push   $0x8
  jmp __alltraps
  10200b:	e9 21 0a 00 00       	jmp    102a31 <__alltraps>

00102010 <vector9>:
.globl vector9
vector9:
  pushl $9
  102010:	6a 09                	push   $0x9
  jmp __alltraps
  102012:	e9 1a 0a 00 00       	jmp    102a31 <__alltraps>

00102017 <vector10>:
.globl vector10
vector10:
  pushl $10
  102017:	6a 0a                	push   $0xa
  jmp __alltraps
  102019:	e9 13 0a 00 00       	jmp    102a31 <__alltraps>

0010201e <vector11>:
.globl vector11
vector11:
  pushl $11
  10201e:	6a 0b                	push   $0xb
  jmp __alltraps
  102020:	e9 0c 0a 00 00       	jmp    102a31 <__alltraps>

00102025 <vector12>:
.globl vector12
vector12:
  pushl $12
  102025:	6a 0c                	push   $0xc
  jmp __alltraps
  102027:	e9 05 0a 00 00       	jmp    102a31 <__alltraps>

0010202c <vector13>:
.globl vector13
vector13:
  pushl $13
  10202c:	6a 0d                	push   $0xd
  jmp __alltraps
  10202e:	e9 fe 09 00 00       	jmp    102a31 <__alltraps>

00102033 <vector14>:
.globl vector14
vector14:
  pushl $14
  102033:	6a 0e                	push   $0xe
  jmp __alltraps
  102035:	e9 f7 09 00 00       	jmp    102a31 <__alltraps>

0010203a <vector15>:
.globl vector15
vector15:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $15
  10203c:	6a 0f                	push   $0xf
  jmp __alltraps
  10203e:	e9 ee 09 00 00       	jmp    102a31 <__alltraps>

00102043 <vector16>:
.globl vector16
vector16:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $16
  102045:	6a 10                	push   $0x10
  jmp __alltraps
  102047:	e9 e5 09 00 00       	jmp    102a31 <__alltraps>

0010204c <vector17>:
.globl vector17
vector17:
  pushl $17
  10204c:	6a 11                	push   $0x11
  jmp __alltraps
  10204e:	e9 de 09 00 00       	jmp    102a31 <__alltraps>

00102053 <vector18>:
.globl vector18
vector18:
  pushl $0
  102053:	6a 00                	push   $0x0
  pushl $18
  102055:	6a 12                	push   $0x12
  jmp __alltraps
  102057:	e9 d5 09 00 00       	jmp    102a31 <__alltraps>

0010205c <vector19>:
.globl vector19
vector19:
  pushl $0
  10205c:	6a 00                	push   $0x0
  pushl $19
  10205e:	6a 13                	push   $0x13
  jmp __alltraps
  102060:	e9 cc 09 00 00       	jmp    102a31 <__alltraps>

00102065 <vector20>:
.globl vector20
vector20:
  pushl $0
  102065:	6a 00                	push   $0x0
  pushl $20
  102067:	6a 14                	push   $0x14
  jmp __alltraps
  102069:	e9 c3 09 00 00       	jmp    102a31 <__alltraps>

0010206e <vector21>:
.globl vector21
vector21:
  pushl $0
  10206e:	6a 00                	push   $0x0
  pushl $21
  102070:	6a 15                	push   $0x15
  jmp __alltraps
  102072:	e9 ba 09 00 00       	jmp    102a31 <__alltraps>

00102077 <vector22>:
.globl vector22
vector22:
  pushl $0
  102077:	6a 00                	push   $0x0
  pushl $22
  102079:	6a 16                	push   $0x16
  jmp __alltraps
  10207b:	e9 b1 09 00 00       	jmp    102a31 <__alltraps>

00102080 <vector23>:
.globl vector23
vector23:
  pushl $0
  102080:	6a 00                	push   $0x0
  pushl $23
  102082:	6a 17                	push   $0x17
  jmp __alltraps
  102084:	e9 a8 09 00 00       	jmp    102a31 <__alltraps>

00102089 <vector24>:
.globl vector24
vector24:
  pushl $0
  102089:	6a 00                	push   $0x0
  pushl $24
  10208b:	6a 18                	push   $0x18
  jmp __alltraps
  10208d:	e9 9f 09 00 00       	jmp    102a31 <__alltraps>

00102092 <vector25>:
.globl vector25
vector25:
  pushl $0
  102092:	6a 00                	push   $0x0
  pushl $25
  102094:	6a 19                	push   $0x19
  jmp __alltraps
  102096:	e9 96 09 00 00       	jmp    102a31 <__alltraps>

0010209b <vector26>:
.globl vector26
vector26:
  pushl $0
  10209b:	6a 00                	push   $0x0
  pushl $26
  10209d:	6a 1a                	push   $0x1a
  jmp __alltraps
  10209f:	e9 8d 09 00 00       	jmp    102a31 <__alltraps>

001020a4 <vector27>:
.globl vector27
vector27:
  pushl $0
  1020a4:	6a 00                	push   $0x0
  pushl $27
  1020a6:	6a 1b                	push   $0x1b
  jmp __alltraps
  1020a8:	e9 84 09 00 00       	jmp    102a31 <__alltraps>

001020ad <vector28>:
.globl vector28
vector28:
  pushl $0
  1020ad:	6a 00                	push   $0x0
  pushl $28
  1020af:	6a 1c                	push   $0x1c
  jmp __alltraps
  1020b1:	e9 7b 09 00 00       	jmp    102a31 <__alltraps>

001020b6 <vector29>:
.globl vector29
vector29:
  pushl $0
  1020b6:	6a 00                	push   $0x0
  pushl $29
  1020b8:	6a 1d                	push   $0x1d
  jmp __alltraps
  1020ba:	e9 72 09 00 00       	jmp    102a31 <__alltraps>

001020bf <vector30>:
.globl vector30
vector30:
  pushl $0
  1020bf:	6a 00                	push   $0x0
  pushl $30
  1020c1:	6a 1e                	push   $0x1e
  jmp __alltraps
  1020c3:	e9 69 09 00 00       	jmp    102a31 <__alltraps>

001020c8 <vector31>:
.globl vector31
vector31:
  pushl $0
  1020c8:	6a 00                	push   $0x0
  pushl $31
  1020ca:	6a 1f                	push   $0x1f
  jmp __alltraps
  1020cc:	e9 60 09 00 00       	jmp    102a31 <__alltraps>

001020d1 <vector32>:
.globl vector32
vector32:
  pushl $0
  1020d1:	6a 00                	push   $0x0
  pushl $32
  1020d3:	6a 20                	push   $0x20
  jmp __alltraps
  1020d5:	e9 57 09 00 00       	jmp    102a31 <__alltraps>

001020da <vector33>:
.globl vector33
vector33:
  pushl $0
  1020da:	6a 00                	push   $0x0
  pushl $33
  1020dc:	6a 21                	push   $0x21
  jmp __alltraps
  1020de:	e9 4e 09 00 00       	jmp    102a31 <__alltraps>

001020e3 <vector34>:
.globl vector34
vector34:
  pushl $0
  1020e3:	6a 00                	push   $0x0
  pushl $34
  1020e5:	6a 22                	push   $0x22
  jmp __alltraps
  1020e7:	e9 45 09 00 00       	jmp    102a31 <__alltraps>

001020ec <vector35>:
.globl vector35
vector35:
  pushl $0
  1020ec:	6a 00                	push   $0x0
  pushl $35
  1020ee:	6a 23                	push   $0x23
  jmp __alltraps
  1020f0:	e9 3c 09 00 00       	jmp    102a31 <__alltraps>

001020f5 <vector36>:
.globl vector36
vector36:
  pushl $0
  1020f5:	6a 00                	push   $0x0
  pushl $36
  1020f7:	6a 24                	push   $0x24
  jmp __alltraps
  1020f9:	e9 33 09 00 00       	jmp    102a31 <__alltraps>

001020fe <vector37>:
.globl vector37
vector37:
  pushl $0
  1020fe:	6a 00                	push   $0x0
  pushl $37
  102100:	6a 25                	push   $0x25
  jmp __alltraps
  102102:	e9 2a 09 00 00       	jmp    102a31 <__alltraps>

00102107 <vector38>:
.globl vector38
vector38:
  pushl $0
  102107:	6a 00                	push   $0x0
  pushl $38
  102109:	6a 26                	push   $0x26
  jmp __alltraps
  10210b:	e9 21 09 00 00       	jmp    102a31 <__alltraps>

00102110 <vector39>:
.globl vector39
vector39:
  pushl $0
  102110:	6a 00                	push   $0x0
  pushl $39
  102112:	6a 27                	push   $0x27
  jmp __alltraps
  102114:	e9 18 09 00 00       	jmp    102a31 <__alltraps>

00102119 <vector40>:
.globl vector40
vector40:
  pushl $0
  102119:	6a 00                	push   $0x0
  pushl $40
  10211b:	6a 28                	push   $0x28
  jmp __alltraps
  10211d:	e9 0f 09 00 00       	jmp    102a31 <__alltraps>

00102122 <vector41>:
.globl vector41
vector41:
  pushl $0
  102122:	6a 00                	push   $0x0
  pushl $41
  102124:	6a 29                	push   $0x29
  jmp __alltraps
  102126:	e9 06 09 00 00       	jmp    102a31 <__alltraps>

0010212b <vector42>:
.globl vector42
vector42:
  pushl $0
  10212b:	6a 00                	push   $0x0
  pushl $42
  10212d:	6a 2a                	push   $0x2a
  jmp __alltraps
  10212f:	e9 fd 08 00 00       	jmp    102a31 <__alltraps>

00102134 <vector43>:
.globl vector43
vector43:
  pushl $0
  102134:	6a 00                	push   $0x0
  pushl $43
  102136:	6a 2b                	push   $0x2b
  jmp __alltraps
  102138:	e9 f4 08 00 00       	jmp    102a31 <__alltraps>

0010213d <vector44>:
.globl vector44
vector44:
  pushl $0
  10213d:	6a 00                	push   $0x0
  pushl $44
  10213f:	6a 2c                	push   $0x2c
  jmp __alltraps
  102141:	e9 eb 08 00 00       	jmp    102a31 <__alltraps>

00102146 <vector45>:
.globl vector45
vector45:
  pushl $0
  102146:	6a 00                	push   $0x0
  pushl $45
  102148:	6a 2d                	push   $0x2d
  jmp __alltraps
  10214a:	e9 e2 08 00 00       	jmp    102a31 <__alltraps>

0010214f <vector46>:
.globl vector46
vector46:
  pushl $0
  10214f:	6a 00                	push   $0x0
  pushl $46
  102151:	6a 2e                	push   $0x2e
  jmp __alltraps
  102153:	e9 d9 08 00 00       	jmp    102a31 <__alltraps>

00102158 <vector47>:
.globl vector47
vector47:
  pushl $0
  102158:	6a 00                	push   $0x0
  pushl $47
  10215a:	6a 2f                	push   $0x2f
  jmp __alltraps
  10215c:	e9 d0 08 00 00       	jmp    102a31 <__alltraps>

00102161 <vector48>:
.globl vector48
vector48:
  pushl $0
  102161:	6a 00                	push   $0x0
  pushl $48
  102163:	6a 30                	push   $0x30
  jmp __alltraps
  102165:	e9 c7 08 00 00       	jmp    102a31 <__alltraps>

0010216a <vector49>:
.globl vector49
vector49:
  pushl $0
  10216a:	6a 00                	push   $0x0
  pushl $49
  10216c:	6a 31                	push   $0x31
  jmp __alltraps
  10216e:	e9 be 08 00 00       	jmp    102a31 <__alltraps>

00102173 <vector50>:
.globl vector50
vector50:
  pushl $0
  102173:	6a 00                	push   $0x0
  pushl $50
  102175:	6a 32                	push   $0x32
  jmp __alltraps
  102177:	e9 b5 08 00 00       	jmp    102a31 <__alltraps>

0010217c <vector51>:
.globl vector51
vector51:
  pushl $0
  10217c:	6a 00                	push   $0x0
  pushl $51
  10217e:	6a 33                	push   $0x33
  jmp __alltraps
  102180:	e9 ac 08 00 00       	jmp    102a31 <__alltraps>

00102185 <vector52>:
.globl vector52
vector52:
  pushl $0
  102185:	6a 00                	push   $0x0
  pushl $52
  102187:	6a 34                	push   $0x34
  jmp __alltraps
  102189:	e9 a3 08 00 00       	jmp    102a31 <__alltraps>

0010218e <vector53>:
.globl vector53
vector53:
  pushl $0
  10218e:	6a 00                	push   $0x0
  pushl $53
  102190:	6a 35                	push   $0x35
  jmp __alltraps
  102192:	e9 9a 08 00 00       	jmp    102a31 <__alltraps>

00102197 <vector54>:
.globl vector54
vector54:
  pushl $0
  102197:	6a 00                	push   $0x0
  pushl $54
  102199:	6a 36                	push   $0x36
  jmp __alltraps
  10219b:	e9 91 08 00 00       	jmp    102a31 <__alltraps>

001021a0 <vector55>:
.globl vector55
vector55:
  pushl $0
  1021a0:	6a 00                	push   $0x0
  pushl $55
  1021a2:	6a 37                	push   $0x37
  jmp __alltraps
  1021a4:	e9 88 08 00 00       	jmp    102a31 <__alltraps>

001021a9 <vector56>:
.globl vector56
vector56:
  pushl $0
  1021a9:	6a 00                	push   $0x0
  pushl $56
  1021ab:	6a 38                	push   $0x38
  jmp __alltraps
  1021ad:	e9 7f 08 00 00       	jmp    102a31 <__alltraps>

001021b2 <vector57>:
.globl vector57
vector57:
  pushl $0
  1021b2:	6a 00                	push   $0x0
  pushl $57
  1021b4:	6a 39                	push   $0x39
  jmp __alltraps
  1021b6:	e9 76 08 00 00       	jmp    102a31 <__alltraps>

001021bb <vector58>:
.globl vector58
vector58:
  pushl $0
  1021bb:	6a 00                	push   $0x0
  pushl $58
  1021bd:	6a 3a                	push   $0x3a
  jmp __alltraps
  1021bf:	e9 6d 08 00 00       	jmp    102a31 <__alltraps>

001021c4 <vector59>:
.globl vector59
vector59:
  pushl $0
  1021c4:	6a 00                	push   $0x0
  pushl $59
  1021c6:	6a 3b                	push   $0x3b
  jmp __alltraps
  1021c8:	e9 64 08 00 00       	jmp    102a31 <__alltraps>

001021cd <vector60>:
.globl vector60
vector60:
  pushl $0
  1021cd:	6a 00                	push   $0x0
  pushl $60
  1021cf:	6a 3c                	push   $0x3c
  jmp __alltraps
  1021d1:	e9 5b 08 00 00       	jmp    102a31 <__alltraps>

001021d6 <vector61>:
.globl vector61
vector61:
  pushl $0
  1021d6:	6a 00                	push   $0x0
  pushl $61
  1021d8:	6a 3d                	push   $0x3d
  jmp __alltraps
  1021da:	e9 52 08 00 00       	jmp    102a31 <__alltraps>

001021df <vector62>:
.globl vector62
vector62:
  pushl $0
  1021df:	6a 00                	push   $0x0
  pushl $62
  1021e1:	6a 3e                	push   $0x3e
  jmp __alltraps
  1021e3:	e9 49 08 00 00       	jmp    102a31 <__alltraps>

001021e8 <vector63>:
.globl vector63
vector63:
  pushl $0
  1021e8:	6a 00                	push   $0x0
  pushl $63
  1021ea:	6a 3f                	push   $0x3f
  jmp __alltraps
  1021ec:	e9 40 08 00 00       	jmp    102a31 <__alltraps>

001021f1 <vector64>:
.globl vector64
vector64:
  pushl $0
  1021f1:	6a 00                	push   $0x0
  pushl $64
  1021f3:	6a 40                	push   $0x40
  jmp __alltraps
  1021f5:	e9 37 08 00 00       	jmp    102a31 <__alltraps>

001021fa <vector65>:
.globl vector65
vector65:
  pushl $0
  1021fa:	6a 00                	push   $0x0
  pushl $65
  1021fc:	6a 41                	push   $0x41
  jmp __alltraps
  1021fe:	e9 2e 08 00 00       	jmp    102a31 <__alltraps>

00102203 <vector66>:
.globl vector66
vector66:
  pushl $0
  102203:	6a 00                	push   $0x0
  pushl $66
  102205:	6a 42                	push   $0x42
  jmp __alltraps
  102207:	e9 25 08 00 00       	jmp    102a31 <__alltraps>

0010220c <vector67>:
.globl vector67
vector67:
  pushl $0
  10220c:	6a 00                	push   $0x0
  pushl $67
  10220e:	6a 43                	push   $0x43
  jmp __alltraps
  102210:	e9 1c 08 00 00       	jmp    102a31 <__alltraps>

00102215 <vector68>:
.globl vector68
vector68:
  pushl $0
  102215:	6a 00                	push   $0x0
  pushl $68
  102217:	6a 44                	push   $0x44
  jmp __alltraps
  102219:	e9 13 08 00 00       	jmp    102a31 <__alltraps>

0010221e <vector69>:
.globl vector69
vector69:
  pushl $0
  10221e:	6a 00                	push   $0x0
  pushl $69
  102220:	6a 45                	push   $0x45
  jmp __alltraps
  102222:	e9 0a 08 00 00       	jmp    102a31 <__alltraps>

00102227 <vector70>:
.globl vector70
vector70:
  pushl $0
  102227:	6a 00                	push   $0x0
  pushl $70
  102229:	6a 46                	push   $0x46
  jmp __alltraps
  10222b:	e9 01 08 00 00       	jmp    102a31 <__alltraps>

00102230 <vector71>:
.globl vector71
vector71:
  pushl $0
  102230:	6a 00                	push   $0x0
  pushl $71
  102232:	6a 47                	push   $0x47
  jmp __alltraps
  102234:	e9 f8 07 00 00       	jmp    102a31 <__alltraps>

00102239 <vector72>:
.globl vector72
vector72:
  pushl $0
  102239:	6a 00                	push   $0x0
  pushl $72
  10223b:	6a 48                	push   $0x48
  jmp __alltraps
  10223d:	e9 ef 07 00 00       	jmp    102a31 <__alltraps>

00102242 <vector73>:
.globl vector73
vector73:
  pushl $0
  102242:	6a 00                	push   $0x0
  pushl $73
  102244:	6a 49                	push   $0x49
  jmp __alltraps
  102246:	e9 e6 07 00 00       	jmp    102a31 <__alltraps>

0010224b <vector74>:
.globl vector74
vector74:
  pushl $0
  10224b:	6a 00                	push   $0x0
  pushl $74
  10224d:	6a 4a                	push   $0x4a
  jmp __alltraps
  10224f:	e9 dd 07 00 00       	jmp    102a31 <__alltraps>

00102254 <vector75>:
.globl vector75
vector75:
  pushl $0
  102254:	6a 00                	push   $0x0
  pushl $75
  102256:	6a 4b                	push   $0x4b
  jmp __alltraps
  102258:	e9 d4 07 00 00       	jmp    102a31 <__alltraps>

0010225d <vector76>:
.globl vector76
vector76:
  pushl $0
  10225d:	6a 00                	push   $0x0
  pushl $76
  10225f:	6a 4c                	push   $0x4c
  jmp __alltraps
  102261:	e9 cb 07 00 00       	jmp    102a31 <__alltraps>

00102266 <vector77>:
.globl vector77
vector77:
  pushl $0
  102266:	6a 00                	push   $0x0
  pushl $77
  102268:	6a 4d                	push   $0x4d
  jmp __alltraps
  10226a:	e9 c2 07 00 00       	jmp    102a31 <__alltraps>

0010226f <vector78>:
.globl vector78
vector78:
  pushl $0
  10226f:	6a 00                	push   $0x0
  pushl $78
  102271:	6a 4e                	push   $0x4e
  jmp __alltraps
  102273:	e9 b9 07 00 00       	jmp    102a31 <__alltraps>

00102278 <vector79>:
.globl vector79
vector79:
  pushl $0
  102278:	6a 00                	push   $0x0
  pushl $79
  10227a:	6a 4f                	push   $0x4f
  jmp __alltraps
  10227c:	e9 b0 07 00 00       	jmp    102a31 <__alltraps>

00102281 <vector80>:
.globl vector80
vector80:
  pushl $0
  102281:	6a 00                	push   $0x0
  pushl $80
  102283:	6a 50                	push   $0x50
  jmp __alltraps
  102285:	e9 a7 07 00 00       	jmp    102a31 <__alltraps>

0010228a <vector81>:
.globl vector81
vector81:
  pushl $0
  10228a:	6a 00                	push   $0x0
  pushl $81
  10228c:	6a 51                	push   $0x51
  jmp __alltraps
  10228e:	e9 9e 07 00 00       	jmp    102a31 <__alltraps>

00102293 <vector82>:
.globl vector82
vector82:
  pushl $0
  102293:	6a 00                	push   $0x0
  pushl $82
  102295:	6a 52                	push   $0x52
  jmp __alltraps
  102297:	e9 95 07 00 00       	jmp    102a31 <__alltraps>

0010229c <vector83>:
.globl vector83
vector83:
  pushl $0
  10229c:	6a 00                	push   $0x0
  pushl $83
  10229e:	6a 53                	push   $0x53
  jmp __alltraps
  1022a0:	e9 8c 07 00 00       	jmp    102a31 <__alltraps>

001022a5 <vector84>:
.globl vector84
vector84:
  pushl $0
  1022a5:	6a 00                	push   $0x0
  pushl $84
  1022a7:	6a 54                	push   $0x54
  jmp __alltraps
  1022a9:	e9 83 07 00 00       	jmp    102a31 <__alltraps>

001022ae <vector85>:
.globl vector85
vector85:
  pushl $0
  1022ae:	6a 00                	push   $0x0
  pushl $85
  1022b0:	6a 55                	push   $0x55
  jmp __alltraps
  1022b2:	e9 7a 07 00 00       	jmp    102a31 <__alltraps>

001022b7 <vector86>:
.globl vector86
vector86:
  pushl $0
  1022b7:	6a 00                	push   $0x0
  pushl $86
  1022b9:	6a 56                	push   $0x56
  jmp __alltraps
  1022bb:	e9 71 07 00 00       	jmp    102a31 <__alltraps>

001022c0 <vector87>:
.globl vector87
vector87:
  pushl $0
  1022c0:	6a 00                	push   $0x0
  pushl $87
  1022c2:	6a 57                	push   $0x57
  jmp __alltraps
  1022c4:	e9 68 07 00 00       	jmp    102a31 <__alltraps>

001022c9 <vector88>:
.globl vector88
vector88:
  pushl $0
  1022c9:	6a 00                	push   $0x0
  pushl $88
  1022cb:	6a 58                	push   $0x58
  jmp __alltraps
  1022cd:	e9 5f 07 00 00       	jmp    102a31 <__alltraps>

001022d2 <vector89>:
.globl vector89
vector89:
  pushl $0
  1022d2:	6a 00                	push   $0x0
  pushl $89
  1022d4:	6a 59                	push   $0x59
  jmp __alltraps
  1022d6:	e9 56 07 00 00       	jmp    102a31 <__alltraps>

001022db <vector90>:
.globl vector90
vector90:
  pushl $0
  1022db:	6a 00                	push   $0x0
  pushl $90
  1022dd:	6a 5a                	push   $0x5a
  jmp __alltraps
  1022df:	e9 4d 07 00 00       	jmp    102a31 <__alltraps>

001022e4 <vector91>:
.globl vector91
vector91:
  pushl $0
  1022e4:	6a 00                	push   $0x0
  pushl $91
  1022e6:	6a 5b                	push   $0x5b
  jmp __alltraps
  1022e8:	e9 44 07 00 00       	jmp    102a31 <__alltraps>

001022ed <vector92>:
.globl vector92
vector92:
  pushl $0
  1022ed:	6a 00                	push   $0x0
  pushl $92
  1022ef:	6a 5c                	push   $0x5c
  jmp __alltraps
  1022f1:	e9 3b 07 00 00       	jmp    102a31 <__alltraps>

001022f6 <vector93>:
.globl vector93
vector93:
  pushl $0
  1022f6:	6a 00                	push   $0x0
  pushl $93
  1022f8:	6a 5d                	push   $0x5d
  jmp __alltraps
  1022fa:	e9 32 07 00 00       	jmp    102a31 <__alltraps>

001022ff <vector94>:
.globl vector94
vector94:
  pushl $0
  1022ff:	6a 00                	push   $0x0
  pushl $94
  102301:	6a 5e                	push   $0x5e
  jmp __alltraps
  102303:	e9 29 07 00 00       	jmp    102a31 <__alltraps>

00102308 <vector95>:
.globl vector95
vector95:
  pushl $0
  102308:	6a 00                	push   $0x0
  pushl $95
  10230a:	6a 5f                	push   $0x5f
  jmp __alltraps
  10230c:	e9 20 07 00 00       	jmp    102a31 <__alltraps>

00102311 <vector96>:
.globl vector96
vector96:
  pushl $0
  102311:	6a 00                	push   $0x0
  pushl $96
  102313:	6a 60                	push   $0x60
  jmp __alltraps
  102315:	e9 17 07 00 00       	jmp    102a31 <__alltraps>

0010231a <vector97>:
.globl vector97
vector97:
  pushl $0
  10231a:	6a 00                	push   $0x0
  pushl $97
  10231c:	6a 61                	push   $0x61
  jmp __alltraps
  10231e:	e9 0e 07 00 00       	jmp    102a31 <__alltraps>

00102323 <vector98>:
.globl vector98
vector98:
  pushl $0
  102323:	6a 00                	push   $0x0
  pushl $98
  102325:	6a 62                	push   $0x62
  jmp __alltraps
  102327:	e9 05 07 00 00       	jmp    102a31 <__alltraps>

0010232c <vector99>:
.globl vector99
vector99:
  pushl $0
  10232c:	6a 00                	push   $0x0
  pushl $99
  10232e:	6a 63                	push   $0x63
  jmp __alltraps
  102330:	e9 fc 06 00 00       	jmp    102a31 <__alltraps>

00102335 <vector100>:
.globl vector100
vector100:
  pushl $0
  102335:	6a 00                	push   $0x0
  pushl $100
  102337:	6a 64                	push   $0x64
  jmp __alltraps
  102339:	e9 f3 06 00 00       	jmp    102a31 <__alltraps>

0010233e <vector101>:
.globl vector101
vector101:
  pushl $0
  10233e:	6a 00                	push   $0x0
  pushl $101
  102340:	6a 65                	push   $0x65
  jmp __alltraps
  102342:	e9 ea 06 00 00       	jmp    102a31 <__alltraps>

00102347 <vector102>:
.globl vector102
vector102:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $102
  102349:	6a 66                	push   $0x66
  jmp __alltraps
  10234b:	e9 e1 06 00 00       	jmp    102a31 <__alltraps>

00102350 <vector103>:
.globl vector103
vector103:
  pushl $0
  102350:	6a 00                	push   $0x0
  pushl $103
  102352:	6a 67                	push   $0x67
  jmp __alltraps
  102354:	e9 d8 06 00 00       	jmp    102a31 <__alltraps>

00102359 <vector104>:
.globl vector104
vector104:
  pushl $0
  102359:	6a 00                	push   $0x0
  pushl $104
  10235b:	6a 68                	push   $0x68
  jmp __alltraps
  10235d:	e9 cf 06 00 00       	jmp    102a31 <__alltraps>

00102362 <vector105>:
.globl vector105
vector105:
  pushl $0
  102362:	6a 00                	push   $0x0
  pushl $105
  102364:	6a 69                	push   $0x69
  jmp __alltraps
  102366:	e9 c6 06 00 00       	jmp    102a31 <__alltraps>

0010236b <vector106>:
.globl vector106
vector106:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $106
  10236d:	6a 6a                	push   $0x6a
  jmp __alltraps
  10236f:	e9 bd 06 00 00       	jmp    102a31 <__alltraps>

00102374 <vector107>:
.globl vector107
vector107:
  pushl $0
  102374:	6a 00                	push   $0x0
  pushl $107
  102376:	6a 6b                	push   $0x6b
  jmp __alltraps
  102378:	e9 b4 06 00 00       	jmp    102a31 <__alltraps>

0010237d <vector108>:
.globl vector108
vector108:
  pushl $0
  10237d:	6a 00                	push   $0x0
  pushl $108
  10237f:	6a 6c                	push   $0x6c
  jmp __alltraps
  102381:	e9 ab 06 00 00       	jmp    102a31 <__alltraps>

00102386 <vector109>:
.globl vector109
vector109:
  pushl $0
  102386:	6a 00                	push   $0x0
  pushl $109
  102388:	6a 6d                	push   $0x6d
  jmp __alltraps
  10238a:	e9 a2 06 00 00       	jmp    102a31 <__alltraps>

0010238f <vector110>:
.globl vector110
vector110:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $110
  102391:	6a 6e                	push   $0x6e
  jmp __alltraps
  102393:	e9 99 06 00 00       	jmp    102a31 <__alltraps>

00102398 <vector111>:
.globl vector111
vector111:
  pushl $0
  102398:	6a 00                	push   $0x0
  pushl $111
  10239a:	6a 6f                	push   $0x6f
  jmp __alltraps
  10239c:	e9 90 06 00 00       	jmp    102a31 <__alltraps>

001023a1 <vector112>:
.globl vector112
vector112:
  pushl $0
  1023a1:	6a 00                	push   $0x0
  pushl $112
  1023a3:	6a 70                	push   $0x70
  jmp __alltraps
  1023a5:	e9 87 06 00 00       	jmp    102a31 <__alltraps>

001023aa <vector113>:
.globl vector113
vector113:
  pushl $0
  1023aa:	6a 00                	push   $0x0
  pushl $113
  1023ac:	6a 71                	push   $0x71
  jmp __alltraps
  1023ae:	e9 7e 06 00 00       	jmp    102a31 <__alltraps>

001023b3 <vector114>:
.globl vector114
vector114:
  pushl $0
  1023b3:	6a 00                	push   $0x0
  pushl $114
  1023b5:	6a 72                	push   $0x72
  jmp __alltraps
  1023b7:	e9 75 06 00 00       	jmp    102a31 <__alltraps>

001023bc <vector115>:
.globl vector115
vector115:
  pushl $0
  1023bc:	6a 00                	push   $0x0
  pushl $115
  1023be:	6a 73                	push   $0x73
  jmp __alltraps
  1023c0:	e9 6c 06 00 00       	jmp    102a31 <__alltraps>

001023c5 <vector116>:
.globl vector116
vector116:
  pushl $0
  1023c5:	6a 00                	push   $0x0
  pushl $116
  1023c7:	6a 74                	push   $0x74
  jmp __alltraps
  1023c9:	e9 63 06 00 00       	jmp    102a31 <__alltraps>

001023ce <vector117>:
.globl vector117
vector117:
  pushl $0
  1023ce:	6a 00                	push   $0x0
  pushl $117
  1023d0:	6a 75                	push   $0x75
  jmp __alltraps
  1023d2:	e9 5a 06 00 00       	jmp    102a31 <__alltraps>

001023d7 <vector118>:
.globl vector118
vector118:
  pushl $0
  1023d7:	6a 00                	push   $0x0
  pushl $118
  1023d9:	6a 76                	push   $0x76
  jmp __alltraps
  1023db:	e9 51 06 00 00       	jmp    102a31 <__alltraps>

001023e0 <vector119>:
.globl vector119
vector119:
  pushl $0
  1023e0:	6a 00                	push   $0x0
  pushl $119
  1023e2:	6a 77                	push   $0x77
  jmp __alltraps
  1023e4:	e9 48 06 00 00       	jmp    102a31 <__alltraps>

001023e9 <vector120>:
.globl vector120
vector120:
  pushl $0
  1023e9:	6a 00                	push   $0x0
  pushl $120
  1023eb:	6a 78                	push   $0x78
  jmp __alltraps
  1023ed:	e9 3f 06 00 00       	jmp    102a31 <__alltraps>

001023f2 <vector121>:
.globl vector121
vector121:
  pushl $0
  1023f2:	6a 00                	push   $0x0
  pushl $121
  1023f4:	6a 79                	push   $0x79
  jmp __alltraps
  1023f6:	e9 36 06 00 00       	jmp    102a31 <__alltraps>

001023fb <vector122>:
.globl vector122
vector122:
  pushl $0
  1023fb:	6a 00                	push   $0x0
  pushl $122
  1023fd:	6a 7a                	push   $0x7a
  jmp __alltraps
  1023ff:	e9 2d 06 00 00       	jmp    102a31 <__alltraps>

00102404 <vector123>:
.globl vector123
vector123:
  pushl $0
  102404:	6a 00                	push   $0x0
  pushl $123
  102406:	6a 7b                	push   $0x7b
  jmp __alltraps
  102408:	e9 24 06 00 00       	jmp    102a31 <__alltraps>

0010240d <vector124>:
.globl vector124
vector124:
  pushl $0
  10240d:	6a 00                	push   $0x0
  pushl $124
  10240f:	6a 7c                	push   $0x7c
  jmp __alltraps
  102411:	e9 1b 06 00 00       	jmp    102a31 <__alltraps>

00102416 <vector125>:
.globl vector125
vector125:
  pushl $0
  102416:	6a 00                	push   $0x0
  pushl $125
  102418:	6a 7d                	push   $0x7d
  jmp __alltraps
  10241a:	e9 12 06 00 00       	jmp    102a31 <__alltraps>

0010241f <vector126>:
.globl vector126
vector126:
  pushl $0
  10241f:	6a 00                	push   $0x0
  pushl $126
  102421:	6a 7e                	push   $0x7e
  jmp __alltraps
  102423:	e9 09 06 00 00       	jmp    102a31 <__alltraps>

00102428 <vector127>:
.globl vector127
vector127:
  pushl $0
  102428:	6a 00                	push   $0x0
  pushl $127
  10242a:	6a 7f                	push   $0x7f
  jmp __alltraps
  10242c:	e9 00 06 00 00       	jmp    102a31 <__alltraps>

00102431 <vector128>:
.globl vector128
vector128:
  pushl $0
  102431:	6a 00                	push   $0x0
  pushl $128
  102433:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102438:	e9 f4 05 00 00       	jmp    102a31 <__alltraps>

0010243d <vector129>:
.globl vector129
vector129:
  pushl $0
  10243d:	6a 00                	push   $0x0
  pushl $129
  10243f:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102444:	e9 e8 05 00 00       	jmp    102a31 <__alltraps>

00102449 <vector130>:
.globl vector130
vector130:
  pushl $0
  102449:	6a 00                	push   $0x0
  pushl $130
  10244b:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102450:	e9 dc 05 00 00       	jmp    102a31 <__alltraps>

00102455 <vector131>:
.globl vector131
vector131:
  pushl $0
  102455:	6a 00                	push   $0x0
  pushl $131
  102457:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10245c:	e9 d0 05 00 00       	jmp    102a31 <__alltraps>

00102461 <vector132>:
.globl vector132
vector132:
  pushl $0
  102461:	6a 00                	push   $0x0
  pushl $132
  102463:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102468:	e9 c4 05 00 00       	jmp    102a31 <__alltraps>

0010246d <vector133>:
.globl vector133
vector133:
  pushl $0
  10246d:	6a 00                	push   $0x0
  pushl $133
  10246f:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102474:	e9 b8 05 00 00       	jmp    102a31 <__alltraps>

00102479 <vector134>:
.globl vector134
vector134:
  pushl $0
  102479:	6a 00                	push   $0x0
  pushl $134
  10247b:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102480:	e9 ac 05 00 00       	jmp    102a31 <__alltraps>

00102485 <vector135>:
.globl vector135
vector135:
  pushl $0
  102485:	6a 00                	push   $0x0
  pushl $135
  102487:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10248c:	e9 a0 05 00 00       	jmp    102a31 <__alltraps>

00102491 <vector136>:
.globl vector136
vector136:
  pushl $0
  102491:	6a 00                	push   $0x0
  pushl $136
  102493:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102498:	e9 94 05 00 00       	jmp    102a31 <__alltraps>

0010249d <vector137>:
.globl vector137
vector137:
  pushl $0
  10249d:	6a 00                	push   $0x0
  pushl $137
  10249f:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1024a4:	e9 88 05 00 00       	jmp    102a31 <__alltraps>

001024a9 <vector138>:
.globl vector138
vector138:
  pushl $0
  1024a9:	6a 00                	push   $0x0
  pushl $138
  1024ab:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1024b0:	e9 7c 05 00 00       	jmp    102a31 <__alltraps>

001024b5 <vector139>:
.globl vector139
vector139:
  pushl $0
  1024b5:	6a 00                	push   $0x0
  pushl $139
  1024b7:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1024bc:	e9 70 05 00 00       	jmp    102a31 <__alltraps>

001024c1 <vector140>:
.globl vector140
vector140:
  pushl $0
  1024c1:	6a 00                	push   $0x0
  pushl $140
  1024c3:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1024c8:	e9 64 05 00 00       	jmp    102a31 <__alltraps>

001024cd <vector141>:
.globl vector141
vector141:
  pushl $0
  1024cd:	6a 00                	push   $0x0
  pushl $141
  1024cf:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1024d4:	e9 58 05 00 00       	jmp    102a31 <__alltraps>

001024d9 <vector142>:
.globl vector142
vector142:
  pushl $0
  1024d9:	6a 00                	push   $0x0
  pushl $142
  1024db:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1024e0:	e9 4c 05 00 00       	jmp    102a31 <__alltraps>

001024e5 <vector143>:
.globl vector143
vector143:
  pushl $0
  1024e5:	6a 00                	push   $0x0
  pushl $143
  1024e7:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1024ec:	e9 40 05 00 00       	jmp    102a31 <__alltraps>

001024f1 <vector144>:
.globl vector144
vector144:
  pushl $0
  1024f1:	6a 00                	push   $0x0
  pushl $144
  1024f3:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1024f8:	e9 34 05 00 00       	jmp    102a31 <__alltraps>

001024fd <vector145>:
.globl vector145
vector145:
  pushl $0
  1024fd:	6a 00                	push   $0x0
  pushl $145
  1024ff:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102504:	e9 28 05 00 00       	jmp    102a31 <__alltraps>

00102509 <vector146>:
.globl vector146
vector146:
  pushl $0
  102509:	6a 00                	push   $0x0
  pushl $146
  10250b:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102510:	e9 1c 05 00 00       	jmp    102a31 <__alltraps>

00102515 <vector147>:
.globl vector147
vector147:
  pushl $0
  102515:	6a 00                	push   $0x0
  pushl $147
  102517:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10251c:	e9 10 05 00 00       	jmp    102a31 <__alltraps>

00102521 <vector148>:
.globl vector148
vector148:
  pushl $0
  102521:	6a 00                	push   $0x0
  pushl $148
  102523:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102528:	e9 04 05 00 00       	jmp    102a31 <__alltraps>

0010252d <vector149>:
.globl vector149
vector149:
  pushl $0
  10252d:	6a 00                	push   $0x0
  pushl $149
  10252f:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102534:	e9 f8 04 00 00       	jmp    102a31 <__alltraps>

00102539 <vector150>:
.globl vector150
vector150:
  pushl $0
  102539:	6a 00                	push   $0x0
  pushl $150
  10253b:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102540:	e9 ec 04 00 00       	jmp    102a31 <__alltraps>

00102545 <vector151>:
.globl vector151
vector151:
  pushl $0
  102545:	6a 00                	push   $0x0
  pushl $151
  102547:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10254c:	e9 e0 04 00 00       	jmp    102a31 <__alltraps>

00102551 <vector152>:
.globl vector152
vector152:
  pushl $0
  102551:	6a 00                	push   $0x0
  pushl $152
  102553:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102558:	e9 d4 04 00 00       	jmp    102a31 <__alltraps>

0010255d <vector153>:
.globl vector153
vector153:
  pushl $0
  10255d:	6a 00                	push   $0x0
  pushl $153
  10255f:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102564:	e9 c8 04 00 00       	jmp    102a31 <__alltraps>

00102569 <vector154>:
.globl vector154
vector154:
  pushl $0
  102569:	6a 00                	push   $0x0
  pushl $154
  10256b:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102570:	e9 bc 04 00 00       	jmp    102a31 <__alltraps>

00102575 <vector155>:
.globl vector155
vector155:
  pushl $0
  102575:	6a 00                	push   $0x0
  pushl $155
  102577:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10257c:	e9 b0 04 00 00       	jmp    102a31 <__alltraps>

00102581 <vector156>:
.globl vector156
vector156:
  pushl $0
  102581:	6a 00                	push   $0x0
  pushl $156
  102583:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102588:	e9 a4 04 00 00       	jmp    102a31 <__alltraps>

0010258d <vector157>:
.globl vector157
vector157:
  pushl $0
  10258d:	6a 00                	push   $0x0
  pushl $157
  10258f:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102594:	e9 98 04 00 00       	jmp    102a31 <__alltraps>

00102599 <vector158>:
.globl vector158
vector158:
  pushl $0
  102599:	6a 00                	push   $0x0
  pushl $158
  10259b:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1025a0:	e9 8c 04 00 00       	jmp    102a31 <__alltraps>

001025a5 <vector159>:
.globl vector159
vector159:
  pushl $0
  1025a5:	6a 00                	push   $0x0
  pushl $159
  1025a7:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1025ac:	e9 80 04 00 00       	jmp    102a31 <__alltraps>

001025b1 <vector160>:
.globl vector160
vector160:
  pushl $0
  1025b1:	6a 00                	push   $0x0
  pushl $160
  1025b3:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1025b8:	e9 74 04 00 00       	jmp    102a31 <__alltraps>

001025bd <vector161>:
.globl vector161
vector161:
  pushl $0
  1025bd:	6a 00                	push   $0x0
  pushl $161
  1025bf:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1025c4:	e9 68 04 00 00       	jmp    102a31 <__alltraps>

001025c9 <vector162>:
.globl vector162
vector162:
  pushl $0
  1025c9:	6a 00                	push   $0x0
  pushl $162
  1025cb:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1025d0:	e9 5c 04 00 00       	jmp    102a31 <__alltraps>

001025d5 <vector163>:
.globl vector163
vector163:
  pushl $0
  1025d5:	6a 00                	push   $0x0
  pushl $163
  1025d7:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1025dc:	e9 50 04 00 00       	jmp    102a31 <__alltraps>

001025e1 <vector164>:
.globl vector164
vector164:
  pushl $0
  1025e1:	6a 00                	push   $0x0
  pushl $164
  1025e3:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1025e8:	e9 44 04 00 00       	jmp    102a31 <__alltraps>

001025ed <vector165>:
.globl vector165
vector165:
  pushl $0
  1025ed:	6a 00                	push   $0x0
  pushl $165
  1025ef:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1025f4:	e9 38 04 00 00       	jmp    102a31 <__alltraps>

001025f9 <vector166>:
.globl vector166
vector166:
  pushl $0
  1025f9:	6a 00                	push   $0x0
  pushl $166
  1025fb:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102600:	e9 2c 04 00 00       	jmp    102a31 <__alltraps>

00102605 <vector167>:
.globl vector167
vector167:
  pushl $0
  102605:	6a 00                	push   $0x0
  pushl $167
  102607:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10260c:	e9 20 04 00 00       	jmp    102a31 <__alltraps>

00102611 <vector168>:
.globl vector168
vector168:
  pushl $0
  102611:	6a 00                	push   $0x0
  pushl $168
  102613:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102618:	e9 14 04 00 00       	jmp    102a31 <__alltraps>

0010261d <vector169>:
.globl vector169
vector169:
  pushl $0
  10261d:	6a 00                	push   $0x0
  pushl $169
  10261f:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102624:	e9 08 04 00 00       	jmp    102a31 <__alltraps>

00102629 <vector170>:
.globl vector170
vector170:
  pushl $0
  102629:	6a 00                	push   $0x0
  pushl $170
  10262b:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102630:	e9 fc 03 00 00       	jmp    102a31 <__alltraps>

00102635 <vector171>:
.globl vector171
vector171:
  pushl $0
  102635:	6a 00                	push   $0x0
  pushl $171
  102637:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10263c:	e9 f0 03 00 00       	jmp    102a31 <__alltraps>

00102641 <vector172>:
.globl vector172
vector172:
  pushl $0
  102641:	6a 00                	push   $0x0
  pushl $172
  102643:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102648:	e9 e4 03 00 00       	jmp    102a31 <__alltraps>

0010264d <vector173>:
.globl vector173
vector173:
  pushl $0
  10264d:	6a 00                	push   $0x0
  pushl $173
  10264f:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102654:	e9 d8 03 00 00       	jmp    102a31 <__alltraps>

00102659 <vector174>:
.globl vector174
vector174:
  pushl $0
  102659:	6a 00                	push   $0x0
  pushl $174
  10265b:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102660:	e9 cc 03 00 00       	jmp    102a31 <__alltraps>

00102665 <vector175>:
.globl vector175
vector175:
  pushl $0
  102665:	6a 00                	push   $0x0
  pushl $175
  102667:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10266c:	e9 c0 03 00 00       	jmp    102a31 <__alltraps>

00102671 <vector176>:
.globl vector176
vector176:
  pushl $0
  102671:	6a 00                	push   $0x0
  pushl $176
  102673:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102678:	e9 b4 03 00 00       	jmp    102a31 <__alltraps>

0010267d <vector177>:
.globl vector177
vector177:
  pushl $0
  10267d:	6a 00                	push   $0x0
  pushl $177
  10267f:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102684:	e9 a8 03 00 00       	jmp    102a31 <__alltraps>

00102689 <vector178>:
.globl vector178
vector178:
  pushl $0
  102689:	6a 00                	push   $0x0
  pushl $178
  10268b:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102690:	e9 9c 03 00 00       	jmp    102a31 <__alltraps>

00102695 <vector179>:
.globl vector179
vector179:
  pushl $0
  102695:	6a 00                	push   $0x0
  pushl $179
  102697:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10269c:	e9 90 03 00 00       	jmp    102a31 <__alltraps>

001026a1 <vector180>:
.globl vector180
vector180:
  pushl $0
  1026a1:	6a 00                	push   $0x0
  pushl $180
  1026a3:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1026a8:	e9 84 03 00 00       	jmp    102a31 <__alltraps>

001026ad <vector181>:
.globl vector181
vector181:
  pushl $0
  1026ad:	6a 00                	push   $0x0
  pushl $181
  1026af:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1026b4:	e9 78 03 00 00       	jmp    102a31 <__alltraps>

001026b9 <vector182>:
.globl vector182
vector182:
  pushl $0
  1026b9:	6a 00                	push   $0x0
  pushl $182
  1026bb:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1026c0:	e9 6c 03 00 00       	jmp    102a31 <__alltraps>

001026c5 <vector183>:
.globl vector183
vector183:
  pushl $0
  1026c5:	6a 00                	push   $0x0
  pushl $183
  1026c7:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1026cc:	e9 60 03 00 00       	jmp    102a31 <__alltraps>

001026d1 <vector184>:
.globl vector184
vector184:
  pushl $0
  1026d1:	6a 00                	push   $0x0
  pushl $184
  1026d3:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1026d8:	e9 54 03 00 00       	jmp    102a31 <__alltraps>

001026dd <vector185>:
.globl vector185
vector185:
  pushl $0
  1026dd:	6a 00                	push   $0x0
  pushl $185
  1026df:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1026e4:	e9 48 03 00 00       	jmp    102a31 <__alltraps>

001026e9 <vector186>:
.globl vector186
vector186:
  pushl $0
  1026e9:	6a 00                	push   $0x0
  pushl $186
  1026eb:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1026f0:	e9 3c 03 00 00       	jmp    102a31 <__alltraps>

001026f5 <vector187>:
.globl vector187
vector187:
  pushl $0
  1026f5:	6a 00                	push   $0x0
  pushl $187
  1026f7:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1026fc:	e9 30 03 00 00       	jmp    102a31 <__alltraps>

00102701 <vector188>:
.globl vector188
vector188:
  pushl $0
  102701:	6a 00                	push   $0x0
  pushl $188
  102703:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102708:	e9 24 03 00 00       	jmp    102a31 <__alltraps>

0010270d <vector189>:
.globl vector189
vector189:
  pushl $0
  10270d:	6a 00                	push   $0x0
  pushl $189
  10270f:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102714:	e9 18 03 00 00       	jmp    102a31 <__alltraps>

00102719 <vector190>:
.globl vector190
vector190:
  pushl $0
  102719:	6a 00                	push   $0x0
  pushl $190
  10271b:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102720:	e9 0c 03 00 00       	jmp    102a31 <__alltraps>

00102725 <vector191>:
.globl vector191
vector191:
  pushl $0
  102725:	6a 00                	push   $0x0
  pushl $191
  102727:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10272c:	e9 00 03 00 00       	jmp    102a31 <__alltraps>

00102731 <vector192>:
.globl vector192
vector192:
  pushl $0
  102731:	6a 00                	push   $0x0
  pushl $192
  102733:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102738:	e9 f4 02 00 00       	jmp    102a31 <__alltraps>

0010273d <vector193>:
.globl vector193
vector193:
  pushl $0
  10273d:	6a 00                	push   $0x0
  pushl $193
  10273f:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102744:	e9 e8 02 00 00       	jmp    102a31 <__alltraps>

00102749 <vector194>:
.globl vector194
vector194:
  pushl $0
  102749:	6a 00                	push   $0x0
  pushl $194
  10274b:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102750:	e9 dc 02 00 00       	jmp    102a31 <__alltraps>

00102755 <vector195>:
.globl vector195
vector195:
  pushl $0
  102755:	6a 00                	push   $0x0
  pushl $195
  102757:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10275c:	e9 d0 02 00 00       	jmp    102a31 <__alltraps>

00102761 <vector196>:
.globl vector196
vector196:
  pushl $0
  102761:	6a 00                	push   $0x0
  pushl $196
  102763:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102768:	e9 c4 02 00 00       	jmp    102a31 <__alltraps>

0010276d <vector197>:
.globl vector197
vector197:
  pushl $0
  10276d:	6a 00                	push   $0x0
  pushl $197
  10276f:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102774:	e9 b8 02 00 00       	jmp    102a31 <__alltraps>

00102779 <vector198>:
.globl vector198
vector198:
  pushl $0
  102779:	6a 00                	push   $0x0
  pushl $198
  10277b:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102780:	e9 ac 02 00 00       	jmp    102a31 <__alltraps>

00102785 <vector199>:
.globl vector199
vector199:
  pushl $0
  102785:	6a 00                	push   $0x0
  pushl $199
  102787:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10278c:	e9 a0 02 00 00       	jmp    102a31 <__alltraps>

00102791 <vector200>:
.globl vector200
vector200:
  pushl $0
  102791:	6a 00                	push   $0x0
  pushl $200
  102793:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102798:	e9 94 02 00 00       	jmp    102a31 <__alltraps>

0010279d <vector201>:
.globl vector201
vector201:
  pushl $0
  10279d:	6a 00                	push   $0x0
  pushl $201
  10279f:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1027a4:	e9 88 02 00 00       	jmp    102a31 <__alltraps>

001027a9 <vector202>:
.globl vector202
vector202:
  pushl $0
  1027a9:	6a 00                	push   $0x0
  pushl $202
  1027ab:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1027b0:	e9 7c 02 00 00       	jmp    102a31 <__alltraps>

001027b5 <vector203>:
.globl vector203
vector203:
  pushl $0
  1027b5:	6a 00                	push   $0x0
  pushl $203
  1027b7:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1027bc:	e9 70 02 00 00       	jmp    102a31 <__alltraps>

001027c1 <vector204>:
.globl vector204
vector204:
  pushl $0
  1027c1:	6a 00                	push   $0x0
  pushl $204
  1027c3:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1027c8:	e9 64 02 00 00       	jmp    102a31 <__alltraps>

001027cd <vector205>:
.globl vector205
vector205:
  pushl $0
  1027cd:	6a 00                	push   $0x0
  pushl $205
  1027cf:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1027d4:	e9 58 02 00 00       	jmp    102a31 <__alltraps>

001027d9 <vector206>:
.globl vector206
vector206:
  pushl $0
  1027d9:	6a 00                	push   $0x0
  pushl $206
  1027db:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1027e0:	e9 4c 02 00 00       	jmp    102a31 <__alltraps>

001027e5 <vector207>:
.globl vector207
vector207:
  pushl $0
  1027e5:	6a 00                	push   $0x0
  pushl $207
  1027e7:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1027ec:	e9 40 02 00 00       	jmp    102a31 <__alltraps>

001027f1 <vector208>:
.globl vector208
vector208:
  pushl $0
  1027f1:	6a 00                	push   $0x0
  pushl $208
  1027f3:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1027f8:	e9 34 02 00 00       	jmp    102a31 <__alltraps>

001027fd <vector209>:
.globl vector209
vector209:
  pushl $0
  1027fd:	6a 00                	push   $0x0
  pushl $209
  1027ff:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102804:	e9 28 02 00 00       	jmp    102a31 <__alltraps>

00102809 <vector210>:
.globl vector210
vector210:
  pushl $0
  102809:	6a 00                	push   $0x0
  pushl $210
  10280b:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102810:	e9 1c 02 00 00       	jmp    102a31 <__alltraps>

00102815 <vector211>:
.globl vector211
vector211:
  pushl $0
  102815:	6a 00                	push   $0x0
  pushl $211
  102817:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10281c:	e9 10 02 00 00       	jmp    102a31 <__alltraps>

00102821 <vector212>:
.globl vector212
vector212:
  pushl $0
  102821:	6a 00                	push   $0x0
  pushl $212
  102823:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102828:	e9 04 02 00 00       	jmp    102a31 <__alltraps>

0010282d <vector213>:
.globl vector213
vector213:
  pushl $0
  10282d:	6a 00                	push   $0x0
  pushl $213
  10282f:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102834:	e9 f8 01 00 00       	jmp    102a31 <__alltraps>

00102839 <vector214>:
.globl vector214
vector214:
  pushl $0
  102839:	6a 00                	push   $0x0
  pushl $214
  10283b:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102840:	e9 ec 01 00 00       	jmp    102a31 <__alltraps>

00102845 <vector215>:
.globl vector215
vector215:
  pushl $0
  102845:	6a 00                	push   $0x0
  pushl $215
  102847:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10284c:	e9 e0 01 00 00       	jmp    102a31 <__alltraps>

00102851 <vector216>:
.globl vector216
vector216:
  pushl $0
  102851:	6a 00                	push   $0x0
  pushl $216
  102853:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102858:	e9 d4 01 00 00       	jmp    102a31 <__alltraps>

0010285d <vector217>:
.globl vector217
vector217:
  pushl $0
  10285d:	6a 00                	push   $0x0
  pushl $217
  10285f:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102864:	e9 c8 01 00 00       	jmp    102a31 <__alltraps>

00102869 <vector218>:
.globl vector218
vector218:
  pushl $0
  102869:	6a 00                	push   $0x0
  pushl $218
  10286b:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102870:	e9 bc 01 00 00       	jmp    102a31 <__alltraps>

00102875 <vector219>:
.globl vector219
vector219:
  pushl $0
  102875:	6a 00                	push   $0x0
  pushl $219
  102877:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10287c:	e9 b0 01 00 00       	jmp    102a31 <__alltraps>

00102881 <vector220>:
.globl vector220
vector220:
  pushl $0
  102881:	6a 00                	push   $0x0
  pushl $220
  102883:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102888:	e9 a4 01 00 00       	jmp    102a31 <__alltraps>

0010288d <vector221>:
.globl vector221
vector221:
  pushl $0
  10288d:	6a 00                	push   $0x0
  pushl $221
  10288f:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102894:	e9 98 01 00 00       	jmp    102a31 <__alltraps>

00102899 <vector222>:
.globl vector222
vector222:
  pushl $0
  102899:	6a 00                	push   $0x0
  pushl $222
  10289b:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1028a0:	e9 8c 01 00 00       	jmp    102a31 <__alltraps>

001028a5 <vector223>:
.globl vector223
vector223:
  pushl $0
  1028a5:	6a 00                	push   $0x0
  pushl $223
  1028a7:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1028ac:	e9 80 01 00 00       	jmp    102a31 <__alltraps>

001028b1 <vector224>:
.globl vector224
vector224:
  pushl $0
  1028b1:	6a 00                	push   $0x0
  pushl $224
  1028b3:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1028b8:	e9 74 01 00 00       	jmp    102a31 <__alltraps>

001028bd <vector225>:
.globl vector225
vector225:
  pushl $0
  1028bd:	6a 00                	push   $0x0
  pushl $225
  1028bf:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1028c4:	e9 68 01 00 00       	jmp    102a31 <__alltraps>

001028c9 <vector226>:
.globl vector226
vector226:
  pushl $0
  1028c9:	6a 00                	push   $0x0
  pushl $226
  1028cb:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1028d0:	e9 5c 01 00 00       	jmp    102a31 <__alltraps>

001028d5 <vector227>:
.globl vector227
vector227:
  pushl $0
  1028d5:	6a 00                	push   $0x0
  pushl $227
  1028d7:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1028dc:	e9 50 01 00 00       	jmp    102a31 <__alltraps>

001028e1 <vector228>:
.globl vector228
vector228:
  pushl $0
  1028e1:	6a 00                	push   $0x0
  pushl $228
  1028e3:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1028e8:	e9 44 01 00 00       	jmp    102a31 <__alltraps>

001028ed <vector229>:
.globl vector229
vector229:
  pushl $0
  1028ed:	6a 00                	push   $0x0
  pushl $229
  1028ef:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1028f4:	e9 38 01 00 00       	jmp    102a31 <__alltraps>

001028f9 <vector230>:
.globl vector230
vector230:
  pushl $0
  1028f9:	6a 00                	push   $0x0
  pushl $230
  1028fb:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102900:	e9 2c 01 00 00       	jmp    102a31 <__alltraps>

00102905 <vector231>:
.globl vector231
vector231:
  pushl $0
  102905:	6a 00                	push   $0x0
  pushl $231
  102907:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10290c:	e9 20 01 00 00       	jmp    102a31 <__alltraps>

00102911 <vector232>:
.globl vector232
vector232:
  pushl $0
  102911:	6a 00                	push   $0x0
  pushl $232
  102913:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102918:	e9 14 01 00 00       	jmp    102a31 <__alltraps>

0010291d <vector233>:
.globl vector233
vector233:
  pushl $0
  10291d:	6a 00                	push   $0x0
  pushl $233
  10291f:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102924:	e9 08 01 00 00       	jmp    102a31 <__alltraps>

00102929 <vector234>:
.globl vector234
vector234:
  pushl $0
  102929:	6a 00                	push   $0x0
  pushl $234
  10292b:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102930:	e9 fc 00 00 00       	jmp    102a31 <__alltraps>

00102935 <vector235>:
.globl vector235
vector235:
  pushl $0
  102935:	6a 00                	push   $0x0
  pushl $235
  102937:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10293c:	e9 f0 00 00 00       	jmp    102a31 <__alltraps>

00102941 <vector236>:
.globl vector236
vector236:
  pushl $0
  102941:	6a 00                	push   $0x0
  pushl $236
  102943:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102948:	e9 e4 00 00 00       	jmp    102a31 <__alltraps>

0010294d <vector237>:
.globl vector237
vector237:
  pushl $0
  10294d:	6a 00                	push   $0x0
  pushl $237
  10294f:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102954:	e9 d8 00 00 00       	jmp    102a31 <__alltraps>

00102959 <vector238>:
.globl vector238
vector238:
  pushl $0
  102959:	6a 00                	push   $0x0
  pushl $238
  10295b:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102960:	e9 cc 00 00 00       	jmp    102a31 <__alltraps>

00102965 <vector239>:
.globl vector239
vector239:
  pushl $0
  102965:	6a 00                	push   $0x0
  pushl $239
  102967:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10296c:	e9 c0 00 00 00       	jmp    102a31 <__alltraps>

00102971 <vector240>:
.globl vector240
vector240:
  pushl $0
  102971:	6a 00                	push   $0x0
  pushl $240
  102973:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102978:	e9 b4 00 00 00       	jmp    102a31 <__alltraps>

0010297d <vector241>:
.globl vector241
vector241:
  pushl $0
  10297d:	6a 00                	push   $0x0
  pushl $241
  10297f:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102984:	e9 a8 00 00 00       	jmp    102a31 <__alltraps>

00102989 <vector242>:
.globl vector242
vector242:
  pushl $0
  102989:	6a 00                	push   $0x0
  pushl $242
  10298b:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102990:	e9 9c 00 00 00       	jmp    102a31 <__alltraps>

00102995 <vector243>:
.globl vector243
vector243:
  pushl $0
  102995:	6a 00                	push   $0x0
  pushl $243
  102997:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10299c:	e9 90 00 00 00       	jmp    102a31 <__alltraps>

001029a1 <vector244>:
.globl vector244
vector244:
  pushl $0
  1029a1:	6a 00                	push   $0x0
  pushl $244
  1029a3:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1029a8:	e9 84 00 00 00       	jmp    102a31 <__alltraps>

001029ad <vector245>:
.globl vector245
vector245:
  pushl $0
  1029ad:	6a 00                	push   $0x0
  pushl $245
  1029af:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1029b4:	e9 78 00 00 00       	jmp    102a31 <__alltraps>

001029b9 <vector246>:
.globl vector246
vector246:
  pushl $0
  1029b9:	6a 00                	push   $0x0
  pushl $246
  1029bb:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1029c0:	e9 6c 00 00 00       	jmp    102a31 <__alltraps>

001029c5 <vector247>:
.globl vector247
vector247:
  pushl $0
  1029c5:	6a 00                	push   $0x0
  pushl $247
  1029c7:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1029cc:	e9 60 00 00 00       	jmp    102a31 <__alltraps>

001029d1 <vector248>:
.globl vector248
vector248:
  pushl $0
  1029d1:	6a 00                	push   $0x0
  pushl $248
  1029d3:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1029d8:	e9 54 00 00 00       	jmp    102a31 <__alltraps>

001029dd <vector249>:
.globl vector249
vector249:
  pushl $0
  1029dd:	6a 00                	push   $0x0
  pushl $249
  1029df:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1029e4:	e9 48 00 00 00       	jmp    102a31 <__alltraps>

001029e9 <vector250>:
.globl vector250
vector250:
  pushl $0
  1029e9:	6a 00                	push   $0x0
  pushl $250
  1029eb:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1029f0:	e9 3c 00 00 00       	jmp    102a31 <__alltraps>

001029f5 <vector251>:
.globl vector251
vector251:
  pushl $0
  1029f5:	6a 00                	push   $0x0
  pushl $251
  1029f7:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1029fc:	e9 30 00 00 00       	jmp    102a31 <__alltraps>

00102a01 <vector252>:
.globl vector252
vector252:
  pushl $0
  102a01:	6a 00                	push   $0x0
  pushl $252
  102a03:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102a08:	e9 24 00 00 00       	jmp    102a31 <__alltraps>

00102a0d <vector253>:
.globl vector253
vector253:
  pushl $0
  102a0d:	6a 00                	push   $0x0
  pushl $253
  102a0f:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102a14:	e9 18 00 00 00       	jmp    102a31 <__alltraps>

00102a19 <vector254>:
.globl vector254
vector254:
  pushl $0
  102a19:	6a 00                	push   $0x0
  pushl $254
  102a1b:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102a20:	e9 0c 00 00 00       	jmp    102a31 <__alltraps>

00102a25 <vector255>:
.globl vector255
vector255:
  pushl $0
  102a25:	6a 00                	push   $0x0
  pushl $255
  102a27:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102a2c:	e9 00 00 00 00       	jmp    102a31 <__alltraps>

00102a31 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102a31:	1e                   	push   %ds
    pushl %es
  102a32:	06                   	push   %es
    pushl %fs
  102a33:	0f a0                	push   %fs
    pushl %gs
  102a35:	0f a8                	push   %gs
    pushal
  102a37:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102a38:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102a3d:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102a3f:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102a41:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102a42:	e8 59 f5 ff ff       	call   101fa0 <trap>

    # pop the pushed stack pointer
    popl %esp
  102a47:	5c                   	pop    %esp

00102a48 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102a48:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102a49:	0f a9                	pop    %gs
    popl %fs
  102a4b:	0f a1                	pop    %fs
    popl %es
  102a4d:	07                   	pop    %es
    popl %ds
  102a4e:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102a4f:	83 c4 08             	add    $0x8,%esp
    iret
  102a52:	cf                   	iret   

00102a53 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102a53:	55                   	push   %ebp
  102a54:	89 e5                	mov    %esp,%ebp
  102a56:	e8 21 d8 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102a5b:	05 f5 be 00 00       	add    $0xbef5,%eax
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102a60:	8b 45 08             	mov    0x8(%ebp),%eax
  102a63:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102a66:	b8 23 00 00 00       	mov    $0x23,%eax
  102a6b:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102a6d:	b8 23 00 00 00       	mov    $0x23,%eax
  102a72:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102a74:	b8 10 00 00 00       	mov    $0x10,%eax
  102a79:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102a7b:	b8 10 00 00 00       	mov    $0x10,%eax
  102a80:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102a82:	b8 10 00 00 00       	mov    $0x10,%eax
  102a87:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102a89:	ea 90 2a 10 00 08 00 	ljmp   $0x8,$0x102a90
}
  102a90:	90                   	nop
  102a91:	5d                   	pop    %ebp
  102a92:	c3                   	ret    

00102a93 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102a93:	55                   	push   %ebp
  102a94:	89 e5                	mov    %esp,%ebp
  102a96:	83 ec 10             	sub    $0x10,%esp
  102a99:	e8 de d7 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102a9e:	05 b2 be 00 00       	add    $0xbeb2,%eax
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102aa3:	c7 c2 c0 f9 10 00    	mov    $0x10f9c0,%edx
  102aa9:	81 c2 00 04 00 00    	add    $0x400,%edx
  102aaf:	89 90 f4 0f 00 00    	mov    %edx,0xff4(%eax)
    ts.ts_ss0 = KERNEL_DS;
  102ab5:	66 c7 80 f8 0f 00 00 	movw   $0x10,0xff8(%eax)
  102abc:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102abe:	66 c7 80 f8 ff ff ff 	movw   $0x68,-0x8(%eax)
  102ac5:	68 00 
  102ac7:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102acd:	66 89 90 fa ff ff ff 	mov    %dx,-0x6(%eax)
  102ad4:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102ada:	c1 ea 10             	shr    $0x10,%edx
  102add:	88 90 fc ff ff ff    	mov    %dl,-0x4(%eax)
  102ae3:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102aea:	83 e2 f0             	and    $0xfffffff0,%edx
  102aed:	83 ca 09             	or     $0x9,%edx
  102af0:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102af6:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102afd:	83 ca 10             	or     $0x10,%edx
  102b00:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102b06:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102b0d:	83 e2 9f             	and    $0xffffff9f,%edx
  102b10:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102b16:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102b1d:	83 ca 80             	or     $0xffffff80,%edx
  102b20:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102b26:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102b2d:	83 e2 f0             	and    $0xfffffff0,%edx
  102b30:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102b36:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102b3d:	83 e2 ef             	and    $0xffffffef,%edx
  102b40:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102b46:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102b4d:	83 e2 df             	and    $0xffffffdf,%edx
  102b50:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102b56:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102b5d:	83 ca 40             	or     $0x40,%edx
  102b60:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102b66:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102b6d:	83 e2 7f             	and    $0x7f,%edx
  102b70:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102b76:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102b7c:	c1 ea 18             	shr    $0x18,%edx
  102b7f:	88 90 ff ff ff ff    	mov    %dl,-0x1(%eax)
    gdt[SEG_TSS].sd_s = 0;
  102b85:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102b8c:	83 e2 ef             	and    $0xffffffef,%edx
  102b8f:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)

    // reload all segment registers
    lgdt(&gdt_pd);
  102b95:	8d 80 d0 00 00 00    	lea    0xd0(%eax),%eax
  102b9b:	50                   	push   %eax
  102b9c:	e8 b2 fe ff ff       	call   102a53 <lgdt>
  102ba1:	83 c4 04             	add    $0x4,%esp
  102ba4:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102baa:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102bae:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102bb1:	90                   	nop
  102bb2:	c9                   	leave  
  102bb3:	c3                   	ret    

00102bb4 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102bb4:	55                   	push   %ebp
  102bb5:	89 e5                	mov    %esp,%ebp
  102bb7:	e8 c0 d6 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102bbc:	05 94 bd 00 00       	add    $0xbd94,%eax
    gdt_init();
  102bc1:	e8 cd fe ff ff       	call   102a93 <gdt_init>
}
  102bc6:	90                   	nop
  102bc7:	5d                   	pop    %ebp
  102bc8:	c3                   	ret    

00102bc9 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102bc9:	55                   	push   %ebp
  102bca:	89 e5                	mov    %esp,%ebp
  102bcc:	83 ec 10             	sub    $0x10,%esp
  102bcf:	e8 a8 d6 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102bd4:	05 7c bd 00 00       	add    $0xbd7c,%eax
    size_t cnt = 0;
  102bd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102be0:	eb 04                	jmp    102be6 <strlen+0x1d>
        cnt ++;
  102be2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102be6:	8b 45 08             	mov    0x8(%ebp),%eax
  102be9:	8d 50 01             	lea    0x1(%eax),%edx
  102bec:	89 55 08             	mov    %edx,0x8(%ebp)
  102bef:	0f b6 00             	movzbl (%eax),%eax
  102bf2:	84 c0                	test   %al,%al
  102bf4:	75 ec                	jne    102be2 <strlen+0x19>
    }
    return cnt;
  102bf6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102bf9:	c9                   	leave  
  102bfa:	c3                   	ret    

00102bfb <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102bfb:	55                   	push   %ebp
  102bfc:	89 e5                	mov    %esp,%ebp
  102bfe:	83 ec 10             	sub    $0x10,%esp
  102c01:	e8 76 d6 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102c06:	05 4a bd 00 00       	add    $0xbd4a,%eax
    size_t cnt = 0;
  102c0b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c12:	eb 04                	jmp    102c18 <strnlen+0x1d>
        cnt ++;
  102c14:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c18:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c1b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102c1e:	73 10                	jae    102c30 <strnlen+0x35>
  102c20:	8b 45 08             	mov    0x8(%ebp),%eax
  102c23:	8d 50 01             	lea    0x1(%eax),%edx
  102c26:	89 55 08             	mov    %edx,0x8(%ebp)
  102c29:	0f b6 00             	movzbl (%eax),%eax
  102c2c:	84 c0                	test   %al,%al
  102c2e:	75 e4                	jne    102c14 <strnlen+0x19>
    }
    return cnt;
  102c30:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102c33:	c9                   	leave  
  102c34:	c3                   	ret    

00102c35 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102c35:	55                   	push   %ebp
  102c36:	89 e5                	mov    %esp,%ebp
  102c38:	57                   	push   %edi
  102c39:	56                   	push   %esi
  102c3a:	83 ec 20             	sub    $0x20,%esp
  102c3d:	e8 3a d6 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102c42:	05 0e bd 00 00       	add    $0xbd0e,%eax
  102c47:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c50:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102c53:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c59:	89 d1                	mov    %edx,%ecx
  102c5b:	89 c2                	mov    %eax,%edx
  102c5d:	89 ce                	mov    %ecx,%esi
  102c5f:	89 d7                	mov    %edx,%edi
  102c61:	ac                   	lods   %ds:(%esi),%al
  102c62:	aa                   	stos   %al,%es:(%edi)
  102c63:	84 c0                	test   %al,%al
  102c65:	75 fa                	jne    102c61 <strcpy+0x2c>
  102c67:	89 fa                	mov    %edi,%edx
  102c69:	89 f1                	mov    %esi,%ecx
  102c6b:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102c6e:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102c71:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102c77:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102c78:	83 c4 20             	add    $0x20,%esp
  102c7b:	5e                   	pop    %esi
  102c7c:	5f                   	pop    %edi
  102c7d:	5d                   	pop    %ebp
  102c7e:	c3                   	ret    

00102c7f <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102c7f:	55                   	push   %ebp
  102c80:	89 e5                	mov    %esp,%ebp
  102c82:	83 ec 10             	sub    $0x10,%esp
  102c85:	e8 f2 d5 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102c8a:	05 c6 bc 00 00       	add    $0xbcc6,%eax
    char *p = dst;
  102c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c92:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102c95:	eb 21                	jmp    102cb8 <strncpy+0x39>
        if ((*p = *src) != '\0') {
  102c97:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c9a:	0f b6 10             	movzbl (%eax),%edx
  102c9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ca0:	88 10                	mov    %dl,(%eax)
  102ca2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ca5:	0f b6 00             	movzbl (%eax),%eax
  102ca8:	84 c0                	test   %al,%al
  102caa:	74 04                	je     102cb0 <strncpy+0x31>
            src ++;
  102cac:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102cb0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102cb4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102cb8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cbc:	75 d9                	jne    102c97 <strncpy+0x18>
    }
    return dst;
  102cbe:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102cc1:	c9                   	leave  
  102cc2:	c3                   	ret    

00102cc3 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102cc3:	55                   	push   %ebp
  102cc4:	89 e5                	mov    %esp,%ebp
  102cc6:	57                   	push   %edi
  102cc7:	56                   	push   %esi
  102cc8:	83 ec 20             	sub    $0x20,%esp
  102ccb:	e8 ac d5 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102cd0:	05 80 bc 00 00       	add    $0xbc80,%eax
  102cd5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cde:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102ce1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ce4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ce7:	89 d1                	mov    %edx,%ecx
  102ce9:	89 c2                	mov    %eax,%edx
  102ceb:	89 ce                	mov    %ecx,%esi
  102ced:	89 d7                	mov    %edx,%edi
  102cef:	ac                   	lods   %ds:(%esi),%al
  102cf0:	ae                   	scas   %es:(%edi),%al
  102cf1:	75 08                	jne    102cfb <strcmp+0x38>
  102cf3:	84 c0                	test   %al,%al
  102cf5:	75 f8                	jne    102cef <strcmp+0x2c>
  102cf7:	31 c0                	xor    %eax,%eax
  102cf9:	eb 04                	jmp    102cff <strcmp+0x3c>
  102cfb:	19 c0                	sbb    %eax,%eax
  102cfd:	0c 01                	or     $0x1,%al
  102cff:	89 fa                	mov    %edi,%edx
  102d01:	89 f1                	mov    %esi,%ecx
  102d03:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d06:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102d09:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102d0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102d0f:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102d10:	83 c4 20             	add    $0x20,%esp
  102d13:	5e                   	pop    %esi
  102d14:	5f                   	pop    %edi
  102d15:	5d                   	pop    %ebp
  102d16:	c3                   	ret    

00102d17 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102d17:	55                   	push   %ebp
  102d18:	89 e5                	mov    %esp,%ebp
  102d1a:	e8 5d d5 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102d1f:	05 31 bc 00 00       	add    $0xbc31,%eax
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d24:	eb 0c                	jmp    102d32 <strncmp+0x1b>
        n --, s1 ++, s2 ++;
  102d26:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d2a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d2e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d32:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d36:	74 1a                	je     102d52 <strncmp+0x3b>
  102d38:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3b:	0f b6 00             	movzbl (%eax),%eax
  102d3e:	84 c0                	test   %al,%al
  102d40:	74 10                	je     102d52 <strncmp+0x3b>
  102d42:	8b 45 08             	mov    0x8(%ebp),%eax
  102d45:	0f b6 10             	movzbl (%eax),%edx
  102d48:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d4b:	0f b6 00             	movzbl (%eax),%eax
  102d4e:	38 c2                	cmp    %al,%dl
  102d50:	74 d4                	je     102d26 <strncmp+0xf>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d52:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d56:	74 18                	je     102d70 <strncmp+0x59>
  102d58:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5b:	0f b6 00             	movzbl (%eax),%eax
  102d5e:	0f b6 d0             	movzbl %al,%edx
  102d61:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d64:	0f b6 00             	movzbl (%eax),%eax
  102d67:	0f b6 c0             	movzbl %al,%eax
  102d6a:	29 c2                	sub    %eax,%edx
  102d6c:	89 d0                	mov    %edx,%eax
  102d6e:	eb 05                	jmp    102d75 <strncmp+0x5e>
  102d70:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d75:	5d                   	pop    %ebp
  102d76:	c3                   	ret    

00102d77 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102d77:	55                   	push   %ebp
  102d78:	89 e5                	mov    %esp,%ebp
  102d7a:	83 ec 04             	sub    $0x4,%esp
  102d7d:	e8 fa d4 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102d82:	05 ce bb 00 00       	add    $0xbbce,%eax
  102d87:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d8a:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102d8d:	eb 14                	jmp    102da3 <strchr+0x2c>
        if (*s == c) {
  102d8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d92:	0f b6 00             	movzbl (%eax),%eax
  102d95:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102d98:	75 05                	jne    102d9f <strchr+0x28>
            return (char *)s;
  102d9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9d:	eb 13                	jmp    102db2 <strchr+0x3b>
        }
        s ++;
  102d9f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102da3:	8b 45 08             	mov    0x8(%ebp),%eax
  102da6:	0f b6 00             	movzbl (%eax),%eax
  102da9:	84 c0                	test   %al,%al
  102dab:	75 e2                	jne    102d8f <strchr+0x18>
    }
    return NULL;
  102dad:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102db2:	c9                   	leave  
  102db3:	c3                   	ret    

00102db4 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102db4:	55                   	push   %ebp
  102db5:	89 e5                	mov    %esp,%ebp
  102db7:	83 ec 04             	sub    $0x4,%esp
  102dba:	e8 bd d4 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102dbf:	05 91 bb 00 00       	add    $0xbb91,%eax
  102dc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc7:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102dca:	eb 0f                	jmp    102ddb <strfind+0x27>
        if (*s == c) {
  102dcc:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcf:	0f b6 00             	movzbl (%eax),%eax
  102dd2:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102dd5:	74 10                	je     102de7 <strfind+0x33>
            break;
        }
        s ++;
  102dd7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102ddb:	8b 45 08             	mov    0x8(%ebp),%eax
  102dde:	0f b6 00             	movzbl (%eax),%eax
  102de1:	84 c0                	test   %al,%al
  102de3:	75 e7                	jne    102dcc <strfind+0x18>
  102de5:	eb 01                	jmp    102de8 <strfind+0x34>
            break;
  102de7:	90                   	nop
    }
    return (char *)s;
  102de8:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102deb:	c9                   	leave  
  102dec:	c3                   	ret    

00102ded <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102ded:	55                   	push   %ebp
  102dee:	89 e5                	mov    %esp,%ebp
  102df0:	83 ec 10             	sub    $0x10,%esp
  102df3:	e8 84 d4 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102df8:	05 58 bb 00 00       	add    $0xbb58,%eax
    int neg = 0;
  102dfd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102e04:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102e0b:	eb 04                	jmp    102e11 <strtol+0x24>
        s ++;
  102e0d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102e11:	8b 45 08             	mov    0x8(%ebp),%eax
  102e14:	0f b6 00             	movzbl (%eax),%eax
  102e17:	3c 20                	cmp    $0x20,%al
  102e19:	74 f2                	je     102e0d <strtol+0x20>
  102e1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1e:	0f b6 00             	movzbl (%eax),%eax
  102e21:	3c 09                	cmp    $0x9,%al
  102e23:	74 e8                	je     102e0d <strtol+0x20>
    }

    // plus/minus sign
    if (*s == '+') {
  102e25:	8b 45 08             	mov    0x8(%ebp),%eax
  102e28:	0f b6 00             	movzbl (%eax),%eax
  102e2b:	3c 2b                	cmp    $0x2b,%al
  102e2d:	75 06                	jne    102e35 <strtol+0x48>
        s ++;
  102e2f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102e33:	eb 15                	jmp    102e4a <strtol+0x5d>
    }
    else if (*s == '-') {
  102e35:	8b 45 08             	mov    0x8(%ebp),%eax
  102e38:	0f b6 00             	movzbl (%eax),%eax
  102e3b:	3c 2d                	cmp    $0x2d,%al
  102e3d:	75 0b                	jne    102e4a <strtol+0x5d>
        s ++, neg = 1;
  102e3f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102e43:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102e4a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e4e:	74 06                	je     102e56 <strtol+0x69>
  102e50:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102e54:	75 24                	jne    102e7a <strtol+0x8d>
  102e56:	8b 45 08             	mov    0x8(%ebp),%eax
  102e59:	0f b6 00             	movzbl (%eax),%eax
  102e5c:	3c 30                	cmp    $0x30,%al
  102e5e:	75 1a                	jne    102e7a <strtol+0x8d>
  102e60:	8b 45 08             	mov    0x8(%ebp),%eax
  102e63:	83 c0 01             	add    $0x1,%eax
  102e66:	0f b6 00             	movzbl (%eax),%eax
  102e69:	3c 78                	cmp    $0x78,%al
  102e6b:	75 0d                	jne    102e7a <strtol+0x8d>
        s += 2, base = 16;
  102e6d:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102e71:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102e78:	eb 2a                	jmp    102ea4 <strtol+0xb7>
    }
    else if (base == 0 && s[0] == '0') {
  102e7a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e7e:	75 17                	jne    102e97 <strtol+0xaa>
  102e80:	8b 45 08             	mov    0x8(%ebp),%eax
  102e83:	0f b6 00             	movzbl (%eax),%eax
  102e86:	3c 30                	cmp    $0x30,%al
  102e88:	75 0d                	jne    102e97 <strtol+0xaa>
        s ++, base = 8;
  102e8a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102e8e:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102e95:	eb 0d                	jmp    102ea4 <strtol+0xb7>
    }
    else if (base == 0) {
  102e97:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e9b:	75 07                	jne    102ea4 <strtol+0xb7>
        base = 10;
  102e9d:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102ea4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea7:	0f b6 00             	movzbl (%eax),%eax
  102eaa:	3c 2f                	cmp    $0x2f,%al
  102eac:	7e 1b                	jle    102ec9 <strtol+0xdc>
  102eae:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb1:	0f b6 00             	movzbl (%eax),%eax
  102eb4:	3c 39                	cmp    $0x39,%al
  102eb6:	7f 11                	jg     102ec9 <strtol+0xdc>
            dig = *s - '0';
  102eb8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ebb:	0f b6 00             	movzbl (%eax),%eax
  102ebe:	0f be c0             	movsbl %al,%eax
  102ec1:	83 e8 30             	sub    $0x30,%eax
  102ec4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ec7:	eb 48                	jmp    102f11 <strtol+0x124>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102ec9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecc:	0f b6 00             	movzbl (%eax),%eax
  102ecf:	3c 60                	cmp    $0x60,%al
  102ed1:	7e 1b                	jle    102eee <strtol+0x101>
  102ed3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed6:	0f b6 00             	movzbl (%eax),%eax
  102ed9:	3c 7a                	cmp    $0x7a,%al
  102edb:	7f 11                	jg     102eee <strtol+0x101>
            dig = *s - 'a' + 10;
  102edd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee0:	0f b6 00             	movzbl (%eax),%eax
  102ee3:	0f be c0             	movsbl %al,%eax
  102ee6:	83 e8 57             	sub    $0x57,%eax
  102ee9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eec:	eb 23                	jmp    102f11 <strtol+0x124>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102eee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef1:	0f b6 00             	movzbl (%eax),%eax
  102ef4:	3c 40                	cmp    $0x40,%al
  102ef6:	7e 3c                	jle    102f34 <strtol+0x147>
  102ef8:	8b 45 08             	mov    0x8(%ebp),%eax
  102efb:	0f b6 00             	movzbl (%eax),%eax
  102efe:	3c 5a                	cmp    $0x5a,%al
  102f00:	7f 32                	jg     102f34 <strtol+0x147>
            dig = *s - 'A' + 10;
  102f02:	8b 45 08             	mov    0x8(%ebp),%eax
  102f05:	0f b6 00             	movzbl (%eax),%eax
  102f08:	0f be c0             	movsbl %al,%eax
  102f0b:	83 e8 37             	sub    $0x37,%eax
  102f0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102f11:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f14:	3b 45 10             	cmp    0x10(%ebp),%eax
  102f17:	7d 1a                	jge    102f33 <strtol+0x146>
            break;
        }
        s ++, val = (val * base) + dig;
  102f19:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f20:	0f af 45 10          	imul   0x10(%ebp),%eax
  102f24:	89 c2                	mov    %eax,%edx
  102f26:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f29:	01 d0                	add    %edx,%eax
  102f2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102f2e:	e9 71 ff ff ff       	jmp    102ea4 <strtol+0xb7>
            break;
  102f33:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102f34:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f38:	74 08                	je     102f42 <strtol+0x155>
        *endptr = (char *) s;
  102f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f3d:	8b 55 08             	mov    0x8(%ebp),%edx
  102f40:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102f42:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102f46:	74 07                	je     102f4f <strtol+0x162>
  102f48:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f4b:	f7 d8                	neg    %eax
  102f4d:	eb 03                	jmp    102f52 <strtol+0x165>
  102f4f:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102f52:	c9                   	leave  
  102f53:	c3                   	ret    

00102f54 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102f54:	55                   	push   %ebp
  102f55:	89 e5                	mov    %esp,%ebp
  102f57:	57                   	push   %edi
  102f58:	83 ec 24             	sub    $0x24,%esp
  102f5b:	e8 1c d3 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102f60:	05 f0 b9 00 00       	add    $0xb9f0,%eax
  102f65:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f68:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102f6b:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102f6f:	8b 55 08             	mov    0x8(%ebp),%edx
  102f72:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102f75:	88 45 f7             	mov    %al,-0x9(%ebp)
  102f78:	8b 45 10             	mov    0x10(%ebp),%eax
  102f7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102f7e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102f81:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102f85:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102f88:	89 d7                	mov    %edx,%edi
  102f8a:	f3 aa                	rep stos %al,%es:(%edi)
  102f8c:	89 fa                	mov    %edi,%edx
  102f8e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102f91:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102f94:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f97:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102f98:	83 c4 24             	add    $0x24,%esp
  102f9b:	5f                   	pop    %edi
  102f9c:	5d                   	pop    %ebp
  102f9d:	c3                   	ret    

00102f9e <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102f9e:	55                   	push   %ebp
  102f9f:	89 e5                	mov    %esp,%ebp
  102fa1:	57                   	push   %edi
  102fa2:	56                   	push   %esi
  102fa3:	53                   	push   %ebx
  102fa4:	83 ec 30             	sub    $0x30,%esp
  102fa7:	e8 d0 d2 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  102fac:	05 a4 b9 00 00       	add    $0xb9a4,%eax
  102fb1:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102fbd:	8b 45 10             	mov    0x10(%ebp),%eax
  102fc0:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102fc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fc6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102fc9:	73 42                	jae    10300d <memmove+0x6f>
  102fcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102fd1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fda:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102fdd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fe0:	c1 e8 02             	shr    $0x2,%eax
  102fe3:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102fe5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102fe8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102feb:	89 d7                	mov    %edx,%edi
  102fed:	89 c6                	mov    %eax,%esi
  102fef:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ff1:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102ff4:	83 e1 03             	and    $0x3,%ecx
  102ff7:	74 02                	je     102ffb <memmove+0x5d>
  102ff9:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ffb:	89 f0                	mov    %esi,%eax
  102ffd:	89 fa                	mov    %edi,%edx
  102fff:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103002:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103005:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  103008:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  10300b:	eb 36                	jmp    103043 <memmove+0xa5>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10300d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103010:	8d 50 ff             	lea    -0x1(%eax),%edx
  103013:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103016:	01 c2                	add    %eax,%edx
  103018:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10301b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10301e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103021:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103024:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103027:	89 c1                	mov    %eax,%ecx
  103029:	89 d8                	mov    %ebx,%eax
  10302b:	89 d6                	mov    %edx,%esi
  10302d:	89 c7                	mov    %eax,%edi
  10302f:	fd                   	std    
  103030:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103032:	fc                   	cld    
  103033:	89 f8                	mov    %edi,%eax
  103035:	89 f2                	mov    %esi,%edx
  103037:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10303a:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10303d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  103040:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103043:	83 c4 30             	add    $0x30,%esp
  103046:	5b                   	pop    %ebx
  103047:	5e                   	pop    %esi
  103048:	5f                   	pop    %edi
  103049:	5d                   	pop    %ebp
  10304a:	c3                   	ret    

0010304b <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10304b:	55                   	push   %ebp
  10304c:	89 e5                	mov    %esp,%ebp
  10304e:	57                   	push   %edi
  10304f:	56                   	push   %esi
  103050:	83 ec 20             	sub    $0x20,%esp
  103053:	e8 24 d2 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  103058:	05 f8 b8 00 00       	add    $0xb8f8,%eax
  10305d:	8b 45 08             	mov    0x8(%ebp),%eax
  103060:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103063:	8b 45 0c             	mov    0xc(%ebp),%eax
  103066:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103069:	8b 45 10             	mov    0x10(%ebp),%eax
  10306c:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10306f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103072:	c1 e8 02             	shr    $0x2,%eax
  103075:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103077:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10307a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10307d:	89 d7                	mov    %edx,%edi
  10307f:	89 c6                	mov    %eax,%esi
  103081:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103083:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103086:	83 e1 03             	and    $0x3,%ecx
  103089:	74 02                	je     10308d <memcpy+0x42>
  10308b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10308d:	89 f0                	mov    %esi,%eax
  10308f:	89 fa                	mov    %edi,%edx
  103091:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103094:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103097:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  10309a:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  10309d:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  10309e:	83 c4 20             	add    $0x20,%esp
  1030a1:	5e                   	pop    %esi
  1030a2:	5f                   	pop    %edi
  1030a3:	5d                   	pop    %ebp
  1030a4:	c3                   	ret    

001030a5 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1030a5:	55                   	push   %ebp
  1030a6:	89 e5                	mov    %esp,%ebp
  1030a8:	83 ec 10             	sub    $0x10,%esp
  1030ab:	e8 cc d1 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1030b0:	05 a0 b8 00 00       	add    $0xb8a0,%eax
    const char *s1 = (const char *)v1;
  1030b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1030bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030be:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1030c1:	eb 30                	jmp    1030f3 <memcmp+0x4e>
        if (*s1 != *s2) {
  1030c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030c6:	0f b6 10             	movzbl (%eax),%edx
  1030c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030cc:	0f b6 00             	movzbl (%eax),%eax
  1030cf:	38 c2                	cmp    %al,%dl
  1030d1:	74 18                	je     1030eb <memcmp+0x46>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1030d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030d6:	0f b6 00             	movzbl (%eax),%eax
  1030d9:	0f b6 d0             	movzbl %al,%edx
  1030dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030df:	0f b6 00             	movzbl (%eax),%eax
  1030e2:	0f b6 c0             	movzbl %al,%eax
  1030e5:	29 c2                	sub    %eax,%edx
  1030e7:	89 d0                	mov    %edx,%eax
  1030e9:	eb 1a                	jmp    103105 <memcmp+0x60>
        }
        s1 ++, s2 ++;
  1030eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1030ef:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  1030f3:	8b 45 10             	mov    0x10(%ebp),%eax
  1030f6:	8d 50 ff             	lea    -0x1(%eax),%edx
  1030f9:	89 55 10             	mov    %edx,0x10(%ebp)
  1030fc:	85 c0                	test   %eax,%eax
  1030fe:	75 c3                	jne    1030c3 <memcmp+0x1e>
    }
    return 0;
  103100:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103105:	c9                   	leave  
  103106:	c3                   	ret    

00103107 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  103107:	55                   	push   %ebp
  103108:	89 e5                	mov    %esp,%ebp
  10310a:	53                   	push   %ebx
  10310b:	83 ec 34             	sub    $0x34,%esp
  10310e:	e8 6d d1 ff ff       	call   100280 <__x86.get_pc_thunk.bx>
  103113:	81 c3 3d b8 00 00    	add    $0xb83d,%ebx
  103119:	8b 45 10             	mov    0x10(%ebp),%eax
  10311c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10311f:	8b 45 14             	mov    0x14(%ebp),%eax
  103122:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103125:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103128:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10312b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10312e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  103131:	8b 45 18             	mov    0x18(%ebp),%eax
  103134:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103137:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10313a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10313d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103140:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103143:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103146:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103149:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10314d:	74 1c                	je     10316b <printnum+0x64>
  10314f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103152:	ba 00 00 00 00       	mov    $0x0,%edx
  103157:	f7 75 e4             	divl   -0x1c(%ebp)
  10315a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10315d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103160:	ba 00 00 00 00       	mov    $0x0,%edx
  103165:	f7 75 e4             	divl   -0x1c(%ebp)
  103168:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10316b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10316e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103171:	f7 75 e4             	divl   -0x1c(%ebp)
  103174:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103177:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10317a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10317d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103180:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103183:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103186:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103189:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  10318c:	8b 45 18             	mov    0x18(%ebp),%eax
  10318f:	ba 00 00 00 00       	mov    $0x0,%edx
  103194:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  103197:	72 41                	jb     1031da <printnum+0xd3>
  103199:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  10319c:	77 05                	ja     1031a3 <printnum+0x9c>
  10319e:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  1031a1:	72 37                	jb     1031da <printnum+0xd3>
        printnum(putch, putdat, result, base, width - 1, padc);
  1031a3:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1031a6:	83 e8 01             	sub    $0x1,%eax
  1031a9:	83 ec 04             	sub    $0x4,%esp
  1031ac:	ff 75 20             	pushl  0x20(%ebp)
  1031af:	50                   	push   %eax
  1031b0:	ff 75 18             	pushl  0x18(%ebp)
  1031b3:	ff 75 ec             	pushl  -0x14(%ebp)
  1031b6:	ff 75 e8             	pushl  -0x18(%ebp)
  1031b9:	ff 75 0c             	pushl  0xc(%ebp)
  1031bc:	ff 75 08             	pushl  0x8(%ebp)
  1031bf:	e8 43 ff ff ff       	call   103107 <printnum>
  1031c4:	83 c4 20             	add    $0x20,%esp
  1031c7:	eb 1b                	jmp    1031e4 <printnum+0xdd>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1031c9:	83 ec 08             	sub    $0x8,%esp
  1031cc:	ff 75 0c             	pushl  0xc(%ebp)
  1031cf:	ff 75 20             	pushl  0x20(%ebp)
  1031d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d5:	ff d0                	call   *%eax
  1031d7:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  1031da:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  1031de:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1031e2:	7f e5                	jg     1031c9 <printnum+0xc2>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1031e4:	8d 93 42 55 ff ff    	lea    -0xaabe(%ebx),%edx
  1031ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1031ed:	01 d0                	add    %edx,%eax
  1031ef:	0f b6 00             	movzbl (%eax),%eax
  1031f2:	0f be c0             	movsbl %al,%eax
  1031f5:	83 ec 08             	sub    $0x8,%esp
  1031f8:	ff 75 0c             	pushl  0xc(%ebp)
  1031fb:	50                   	push   %eax
  1031fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ff:	ff d0                	call   *%eax
  103201:	83 c4 10             	add    $0x10,%esp
}
  103204:	90                   	nop
  103205:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103208:	c9                   	leave  
  103209:	c3                   	ret    

0010320a <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10320a:	55                   	push   %ebp
  10320b:	89 e5                	mov    %esp,%ebp
  10320d:	e8 6a d0 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  103212:	05 3e b7 00 00       	add    $0xb73e,%eax
    if (lflag >= 2) {
  103217:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10321b:	7e 14                	jle    103231 <getuint+0x27>
        return va_arg(*ap, unsigned long long);
  10321d:	8b 45 08             	mov    0x8(%ebp),%eax
  103220:	8b 00                	mov    (%eax),%eax
  103222:	8d 48 08             	lea    0x8(%eax),%ecx
  103225:	8b 55 08             	mov    0x8(%ebp),%edx
  103228:	89 0a                	mov    %ecx,(%edx)
  10322a:	8b 50 04             	mov    0x4(%eax),%edx
  10322d:	8b 00                	mov    (%eax),%eax
  10322f:	eb 30                	jmp    103261 <getuint+0x57>
    }
    else if (lflag) {
  103231:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103235:	74 16                	je     10324d <getuint+0x43>
        return va_arg(*ap, unsigned long);
  103237:	8b 45 08             	mov    0x8(%ebp),%eax
  10323a:	8b 00                	mov    (%eax),%eax
  10323c:	8d 48 04             	lea    0x4(%eax),%ecx
  10323f:	8b 55 08             	mov    0x8(%ebp),%edx
  103242:	89 0a                	mov    %ecx,(%edx)
  103244:	8b 00                	mov    (%eax),%eax
  103246:	ba 00 00 00 00       	mov    $0x0,%edx
  10324b:	eb 14                	jmp    103261 <getuint+0x57>
    }
    else {
        return va_arg(*ap, unsigned int);
  10324d:	8b 45 08             	mov    0x8(%ebp),%eax
  103250:	8b 00                	mov    (%eax),%eax
  103252:	8d 48 04             	lea    0x4(%eax),%ecx
  103255:	8b 55 08             	mov    0x8(%ebp),%edx
  103258:	89 0a                	mov    %ecx,(%edx)
  10325a:	8b 00                	mov    (%eax),%eax
  10325c:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103261:	5d                   	pop    %ebp
  103262:	c3                   	ret    

00103263 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103263:	55                   	push   %ebp
  103264:	89 e5                	mov    %esp,%ebp
  103266:	e8 11 d0 ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  10326b:	05 e5 b6 00 00       	add    $0xb6e5,%eax
    if (lflag >= 2) {
  103270:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103274:	7e 14                	jle    10328a <getint+0x27>
        return va_arg(*ap, long long);
  103276:	8b 45 08             	mov    0x8(%ebp),%eax
  103279:	8b 00                	mov    (%eax),%eax
  10327b:	8d 48 08             	lea    0x8(%eax),%ecx
  10327e:	8b 55 08             	mov    0x8(%ebp),%edx
  103281:	89 0a                	mov    %ecx,(%edx)
  103283:	8b 50 04             	mov    0x4(%eax),%edx
  103286:	8b 00                	mov    (%eax),%eax
  103288:	eb 28                	jmp    1032b2 <getint+0x4f>
    }
    else if (lflag) {
  10328a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10328e:	74 12                	je     1032a2 <getint+0x3f>
        return va_arg(*ap, long);
  103290:	8b 45 08             	mov    0x8(%ebp),%eax
  103293:	8b 00                	mov    (%eax),%eax
  103295:	8d 48 04             	lea    0x4(%eax),%ecx
  103298:	8b 55 08             	mov    0x8(%ebp),%edx
  10329b:	89 0a                	mov    %ecx,(%edx)
  10329d:	8b 00                	mov    (%eax),%eax
  10329f:	99                   	cltd   
  1032a0:	eb 10                	jmp    1032b2 <getint+0x4f>
    }
    else {
        return va_arg(*ap, int);
  1032a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a5:	8b 00                	mov    (%eax),%eax
  1032a7:	8d 48 04             	lea    0x4(%eax),%ecx
  1032aa:	8b 55 08             	mov    0x8(%ebp),%edx
  1032ad:	89 0a                	mov    %ecx,(%edx)
  1032af:	8b 00                	mov    (%eax),%eax
  1032b1:	99                   	cltd   
    }
}
  1032b2:	5d                   	pop    %ebp
  1032b3:	c3                   	ret    

001032b4 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1032b4:	55                   	push   %ebp
  1032b5:	89 e5                	mov    %esp,%ebp
  1032b7:	83 ec 18             	sub    $0x18,%esp
  1032ba:	e8 bd cf ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1032bf:	05 91 b6 00 00       	add    $0xb691,%eax
    va_list ap;

    va_start(ap, fmt);
  1032c4:	8d 45 14             	lea    0x14(%ebp),%eax
  1032c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1032ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032cd:	50                   	push   %eax
  1032ce:	ff 75 10             	pushl  0x10(%ebp)
  1032d1:	ff 75 0c             	pushl  0xc(%ebp)
  1032d4:	ff 75 08             	pushl  0x8(%ebp)
  1032d7:	e8 06 00 00 00       	call   1032e2 <vprintfmt>
  1032dc:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1032df:	90                   	nop
  1032e0:	c9                   	leave  
  1032e1:	c3                   	ret    

001032e2 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1032e2:	55                   	push   %ebp
  1032e3:	89 e5                	mov    %esp,%ebp
  1032e5:	57                   	push   %edi
  1032e6:	56                   	push   %esi
  1032e7:	53                   	push   %ebx
  1032e8:	83 ec 2c             	sub    $0x2c,%esp
  1032eb:	e8 8c 04 00 00       	call   10377c <__x86.get_pc_thunk.di>
  1032f0:	81 c7 60 b6 00 00    	add    $0xb660,%edi
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1032f6:	eb 17                	jmp    10330f <vprintfmt+0x2d>
            if (ch == '\0') {
  1032f8:	85 db                	test   %ebx,%ebx
  1032fa:	0f 84 9a 03 00 00    	je     10369a <.L24+0x2d>
                return;
            }
            putch(ch, putdat);
  103300:	83 ec 08             	sub    $0x8,%esp
  103303:	ff 75 0c             	pushl  0xc(%ebp)
  103306:	53                   	push   %ebx
  103307:	8b 45 08             	mov    0x8(%ebp),%eax
  10330a:	ff d0                	call   *%eax
  10330c:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10330f:	8b 45 10             	mov    0x10(%ebp),%eax
  103312:	8d 50 01             	lea    0x1(%eax),%edx
  103315:	89 55 10             	mov    %edx,0x10(%ebp)
  103318:	0f b6 00             	movzbl (%eax),%eax
  10331b:	0f b6 d8             	movzbl %al,%ebx
  10331e:	83 fb 25             	cmp    $0x25,%ebx
  103321:	75 d5                	jne    1032f8 <vprintfmt+0x16>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103323:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
        width = precision = -1;
  103327:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  10332e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  103331:	89 45 d8             	mov    %eax,-0x28(%ebp)
        lflag = altflag = 0;
  103334:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  10333b:	8b 45 cc             	mov    -0x34(%ebp),%eax
  10333e:	89 45 d0             	mov    %eax,-0x30(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103341:	8b 45 10             	mov    0x10(%ebp),%eax
  103344:	8d 50 01             	lea    0x1(%eax),%edx
  103347:	89 55 10             	mov    %edx,0x10(%ebp)
  10334a:	0f b6 00             	movzbl (%eax),%eax
  10334d:	0f b6 d8             	movzbl %al,%ebx
  103350:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103353:	83 f8 55             	cmp    $0x55,%eax
  103356:	0f 87 11 03 00 00    	ja     10366d <.L24>
  10335c:	c1 e0 02             	shl    $0x2,%eax
  10335f:	8b 84 38 68 55 ff ff 	mov    -0xaa98(%eax,%edi,1),%eax
  103366:	01 f8                	add    %edi,%eax
  103368:	ff e0                	jmp    *%eax

0010336a <.L29>:

        // flag to pad on the right
        case '-':
            padc = '-';
  10336a:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
            goto reswitch;
  10336e:	eb d1                	jmp    103341 <vprintfmt+0x5f>

00103370 <.L31>:

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103370:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
            goto reswitch;
  103374:	eb cb                	jmp    103341 <vprintfmt+0x5f>

00103376 <.L32>:

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103376:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
                precision = precision * 10 + ch - '0';
  10337d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  103380:	89 d0                	mov    %edx,%eax
  103382:	c1 e0 02             	shl    $0x2,%eax
  103385:	01 d0                	add    %edx,%eax
  103387:	01 c0                	add    %eax,%eax
  103389:	01 d8                	add    %ebx,%eax
  10338b:	83 e8 30             	sub    $0x30,%eax
  10338e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                ch = *fmt;
  103391:	8b 45 10             	mov    0x10(%ebp),%eax
  103394:	0f b6 00             	movzbl (%eax),%eax
  103397:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10339a:	83 fb 2f             	cmp    $0x2f,%ebx
  10339d:	7e 39                	jle    1033d8 <.L25+0xc>
  10339f:	83 fb 39             	cmp    $0x39,%ebx
  1033a2:	7f 34                	jg     1033d8 <.L25+0xc>
            for (precision = 0; ; ++ fmt) {
  1033a4:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1033a8:	eb d3                	jmp    10337d <.L32+0x7>

001033aa <.L28>:
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1033aa:	8b 45 14             	mov    0x14(%ebp),%eax
  1033ad:	8d 50 04             	lea    0x4(%eax),%edx
  1033b0:	89 55 14             	mov    %edx,0x14(%ebp)
  1033b3:	8b 00                	mov    (%eax),%eax
  1033b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
            goto process_precision;
  1033b8:	eb 1f                	jmp    1033d9 <.L25+0xd>

001033ba <.L30>:

        case '.':
            if (width < 0)
  1033ba:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1033be:	79 81                	jns    103341 <vprintfmt+0x5f>
                width = 0;
  1033c0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            goto reswitch;
  1033c7:	e9 75 ff ff ff       	jmp    103341 <vprintfmt+0x5f>

001033cc <.L25>:

        case '#':
            altflag = 1;
  1033cc:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
            goto reswitch;
  1033d3:	e9 69 ff ff ff       	jmp    103341 <vprintfmt+0x5f>
            goto process_precision;
  1033d8:	90                   	nop

        process_precision:
            if (width < 0)
  1033d9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1033dd:	0f 89 5e ff ff ff    	jns    103341 <vprintfmt+0x5f>
                width = precision, precision = -1;
  1033e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1033e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1033e9:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
            goto reswitch;
  1033f0:	e9 4c ff ff ff       	jmp    103341 <vprintfmt+0x5f>

001033f5 <.L36>:

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1033f5:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
            goto reswitch;
  1033f9:	e9 43 ff ff ff       	jmp    103341 <vprintfmt+0x5f>

001033fe <.L33>:

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1033fe:	8b 45 14             	mov    0x14(%ebp),%eax
  103401:	8d 50 04             	lea    0x4(%eax),%edx
  103404:	89 55 14             	mov    %edx,0x14(%ebp)
  103407:	8b 00                	mov    (%eax),%eax
  103409:	83 ec 08             	sub    $0x8,%esp
  10340c:	ff 75 0c             	pushl  0xc(%ebp)
  10340f:	50                   	push   %eax
  103410:	8b 45 08             	mov    0x8(%ebp),%eax
  103413:	ff d0                	call   *%eax
  103415:	83 c4 10             	add    $0x10,%esp
            break;
  103418:	e9 78 02 00 00       	jmp    103695 <.L24+0x28>

0010341d <.L35>:

        // error message
        case 'e':
            err = va_arg(ap, int);
  10341d:	8b 45 14             	mov    0x14(%ebp),%eax
  103420:	8d 50 04             	lea    0x4(%eax),%edx
  103423:	89 55 14             	mov    %edx,0x14(%ebp)
  103426:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103428:	85 db                	test   %ebx,%ebx
  10342a:	79 02                	jns    10342e <.L35+0x11>
                err = -err;
  10342c:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10342e:	83 fb 06             	cmp    $0x6,%ebx
  103431:	7f 0b                	jg     10343e <.L35+0x21>
  103433:	8b b4 9f 40 01 00 00 	mov    0x140(%edi,%ebx,4),%esi
  10343a:	85 f6                	test   %esi,%esi
  10343c:	75 1b                	jne    103459 <.L35+0x3c>
                printfmt(putch, putdat, "error %d", err);
  10343e:	53                   	push   %ebx
  10343f:	8d 87 53 55 ff ff    	lea    -0xaaad(%edi),%eax
  103445:	50                   	push   %eax
  103446:	ff 75 0c             	pushl  0xc(%ebp)
  103449:	ff 75 08             	pushl  0x8(%ebp)
  10344c:	e8 63 fe ff ff       	call   1032b4 <printfmt>
  103451:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103454:	e9 3c 02 00 00       	jmp    103695 <.L24+0x28>
                printfmt(putch, putdat, "%s", p);
  103459:	56                   	push   %esi
  10345a:	8d 87 5c 55 ff ff    	lea    -0xaaa4(%edi),%eax
  103460:	50                   	push   %eax
  103461:	ff 75 0c             	pushl  0xc(%ebp)
  103464:	ff 75 08             	pushl  0x8(%ebp)
  103467:	e8 48 fe ff ff       	call   1032b4 <printfmt>
  10346c:	83 c4 10             	add    $0x10,%esp
            break;
  10346f:	e9 21 02 00 00       	jmp    103695 <.L24+0x28>

00103474 <.L39>:

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103474:	8b 45 14             	mov    0x14(%ebp),%eax
  103477:	8d 50 04             	lea    0x4(%eax),%edx
  10347a:	89 55 14             	mov    %edx,0x14(%ebp)
  10347d:	8b 30                	mov    (%eax),%esi
  10347f:	85 f6                	test   %esi,%esi
  103481:	75 06                	jne    103489 <.L39+0x15>
                p = "(null)";
  103483:	8d b7 5f 55 ff ff    	lea    -0xaaa1(%edi),%esi
            }
            if (width > 0 && padc != '-') {
  103489:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10348d:	7e 78                	jle    103507 <.L39+0x93>
  10348f:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  103493:	74 72                	je     103507 <.L39+0x93>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103495:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  103498:	83 ec 08             	sub    $0x8,%esp
  10349b:	50                   	push   %eax
  10349c:	56                   	push   %esi
  10349d:	89 fb                	mov    %edi,%ebx
  10349f:	e8 57 f7 ff ff       	call   102bfb <strnlen>
  1034a4:	83 c4 10             	add    $0x10,%esp
  1034a7:	89 c2                	mov    %eax,%edx
  1034a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1034ac:	29 d0                	sub    %edx,%eax
  1034ae:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1034b1:	eb 17                	jmp    1034ca <.L39+0x56>
                    putch(padc, putdat);
  1034b3:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  1034b7:	83 ec 08             	sub    $0x8,%esp
  1034ba:	ff 75 0c             	pushl  0xc(%ebp)
  1034bd:	50                   	push   %eax
  1034be:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c1:	ff d0                	call   *%eax
  1034c3:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  1034c6:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  1034ca:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1034ce:	7f e3                	jg     1034b3 <.L39+0x3f>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1034d0:	eb 35                	jmp    103507 <.L39+0x93>
                if (altflag && (ch < ' ' || ch > '~')) {
  1034d2:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  1034d6:	74 1c                	je     1034f4 <.L39+0x80>
  1034d8:	83 fb 1f             	cmp    $0x1f,%ebx
  1034db:	7e 05                	jle    1034e2 <.L39+0x6e>
  1034dd:	83 fb 7e             	cmp    $0x7e,%ebx
  1034e0:	7e 12                	jle    1034f4 <.L39+0x80>
                    putch('?', putdat);
  1034e2:	83 ec 08             	sub    $0x8,%esp
  1034e5:	ff 75 0c             	pushl  0xc(%ebp)
  1034e8:	6a 3f                	push   $0x3f
  1034ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ed:	ff d0                	call   *%eax
  1034ef:	83 c4 10             	add    $0x10,%esp
  1034f2:	eb 0f                	jmp    103503 <.L39+0x8f>
                }
                else {
                    putch(ch, putdat);
  1034f4:	83 ec 08             	sub    $0x8,%esp
  1034f7:	ff 75 0c             	pushl  0xc(%ebp)
  1034fa:	53                   	push   %ebx
  1034fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034fe:	ff d0                	call   *%eax
  103500:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103503:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103507:	89 f0                	mov    %esi,%eax
  103509:	8d 70 01             	lea    0x1(%eax),%esi
  10350c:	0f b6 00             	movzbl (%eax),%eax
  10350f:	0f be d8             	movsbl %al,%ebx
  103512:	85 db                	test   %ebx,%ebx
  103514:	74 26                	je     10353c <.L39+0xc8>
  103516:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  10351a:	78 b6                	js     1034d2 <.L39+0x5e>
  10351c:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  103520:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103524:	79 ac                	jns    1034d2 <.L39+0x5e>
                }
            }
            for (; width > 0; width --) {
  103526:	eb 14                	jmp    10353c <.L39+0xc8>
                putch(' ', putdat);
  103528:	83 ec 08             	sub    $0x8,%esp
  10352b:	ff 75 0c             	pushl  0xc(%ebp)
  10352e:	6a 20                	push   $0x20
  103530:	8b 45 08             	mov    0x8(%ebp),%eax
  103533:	ff d0                	call   *%eax
  103535:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  103538:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  10353c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  103540:	7f e6                	jg     103528 <.L39+0xb4>
            }
            break;
  103542:	e9 4e 01 00 00       	jmp    103695 <.L24+0x28>

00103547 <.L34>:

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103547:	83 ec 08             	sub    $0x8,%esp
  10354a:	ff 75 d0             	pushl  -0x30(%ebp)
  10354d:	8d 45 14             	lea    0x14(%ebp),%eax
  103550:	50                   	push   %eax
  103551:	e8 0d fd ff ff       	call   103263 <getint>
  103556:	83 c4 10             	add    $0x10,%esp
  103559:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10355c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            if ((long long)num < 0) {
  10355f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103562:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103565:	85 d2                	test   %edx,%edx
  103567:	79 23                	jns    10358c <.L34+0x45>
                putch('-', putdat);
  103569:	83 ec 08             	sub    $0x8,%esp
  10356c:	ff 75 0c             	pushl  0xc(%ebp)
  10356f:	6a 2d                	push   $0x2d
  103571:	8b 45 08             	mov    0x8(%ebp),%eax
  103574:	ff d0                	call   *%eax
  103576:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103579:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10357c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10357f:	f7 d8                	neg    %eax
  103581:	83 d2 00             	adc    $0x0,%edx
  103584:	f7 da                	neg    %edx
  103586:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103589:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            }
            base = 10;
  10358c:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  103593:	e9 9f 00 00 00       	jmp    103637 <.L41+0x1f>

00103598 <.L40>:

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103598:	83 ec 08             	sub    $0x8,%esp
  10359b:	ff 75 d0             	pushl  -0x30(%ebp)
  10359e:	8d 45 14             	lea    0x14(%ebp),%eax
  1035a1:	50                   	push   %eax
  1035a2:	e8 63 fc ff ff       	call   10320a <getuint>
  1035a7:	83 c4 10             	add    $0x10,%esp
  1035aa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1035ad:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 10;
  1035b0:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  1035b7:	eb 7e                	jmp    103637 <.L41+0x1f>

001035b9 <.L37>:

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1035b9:	83 ec 08             	sub    $0x8,%esp
  1035bc:	ff 75 d0             	pushl  -0x30(%ebp)
  1035bf:	8d 45 14             	lea    0x14(%ebp),%eax
  1035c2:	50                   	push   %eax
  1035c3:	e8 42 fc ff ff       	call   10320a <getuint>
  1035c8:	83 c4 10             	add    $0x10,%esp
  1035cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1035ce:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 8;
  1035d1:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
            goto number;
  1035d8:	eb 5d                	jmp    103637 <.L41+0x1f>

001035da <.L38>:

        // pointer
        case 'p':
            putch('0', putdat);
  1035da:	83 ec 08             	sub    $0x8,%esp
  1035dd:	ff 75 0c             	pushl  0xc(%ebp)
  1035e0:	6a 30                	push   $0x30
  1035e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035e5:	ff d0                	call   *%eax
  1035e7:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1035ea:	83 ec 08             	sub    $0x8,%esp
  1035ed:	ff 75 0c             	pushl  0xc(%ebp)
  1035f0:	6a 78                	push   $0x78
  1035f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035f5:	ff d0                	call   *%eax
  1035f7:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1035fa:	8b 45 14             	mov    0x14(%ebp),%eax
  1035fd:	8d 50 04             	lea    0x4(%eax),%edx
  103600:	89 55 14             	mov    %edx,0x14(%ebp)
  103603:	8b 00                	mov    (%eax),%eax
  103605:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103608:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
            base = 16;
  10360f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
            goto number;
  103616:	eb 1f                	jmp    103637 <.L41+0x1f>

00103618 <.L41>:

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103618:	83 ec 08             	sub    $0x8,%esp
  10361b:	ff 75 d0             	pushl  -0x30(%ebp)
  10361e:	8d 45 14             	lea    0x14(%ebp),%eax
  103621:	50                   	push   %eax
  103622:	e8 e3 fb ff ff       	call   10320a <getuint>
  103627:	83 c4 10             	add    $0x10,%esp
  10362a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10362d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 16;
  103630:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103637:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  10363b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10363e:	83 ec 04             	sub    $0x4,%esp
  103641:	52                   	push   %edx
  103642:	ff 75 d8             	pushl  -0x28(%ebp)
  103645:	50                   	push   %eax
  103646:	ff 75 e4             	pushl  -0x1c(%ebp)
  103649:	ff 75 e0             	pushl  -0x20(%ebp)
  10364c:	ff 75 0c             	pushl  0xc(%ebp)
  10364f:	ff 75 08             	pushl  0x8(%ebp)
  103652:	e8 b0 fa ff ff       	call   103107 <printnum>
  103657:	83 c4 20             	add    $0x20,%esp
            break;
  10365a:	eb 39                	jmp    103695 <.L24+0x28>

0010365c <.L27>:

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10365c:	83 ec 08             	sub    $0x8,%esp
  10365f:	ff 75 0c             	pushl  0xc(%ebp)
  103662:	53                   	push   %ebx
  103663:	8b 45 08             	mov    0x8(%ebp),%eax
  103666:	ff d0                	call   *%eax
  103668:	83 c4 10             	add    $0x10,%esp
            break;
  10366b:	eb 28                	jmp    103695 <.L24+0x28>

0010366d <.L24>:

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10366d:	83 ec 08             	sub    $0x8,%esp
  103670:	ff 75 0c             	pushl  0xc(%ebp)
  103673:	6a 25                	push   $0x25
  103675:	8b 45 08             	mov    0x8(%ebp),%eax
  103678:	ff d0                	call   *%eax
  10367a:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10367d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103681:	eb 04                	jmp    103687 <.L24+0x1a>
  103683:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103687:	8b 45 10             	mov    0x10(%ebp),%eax
  10368a:	83 e8 01             	sub    $0x1,%eax
  10368d:	0f b6 00             	movzbl (%eax),%eax
  103690:	3c 25                	cmp    $0x25,%al
  103692:	75 ef                	jne    103683 <.L24+0x16>
                /* do nothing */;
            break;
  103694:	90                   	nop
    while (1) {
  103695:	e9 5c fc ff ff       	jmp    1032f6 <vprintfmt+0x14>
                return;
  10369a:	90                   	nop
        }
    }
}
  10369b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10369e:	5b                   	pop    %ebx
  10369f:	5e                   	pop    %esi
  1036a0:	5f                   	pop    %edi
  1036a1:	5d                   	pop    %ebp
  1036a2:	c3                   	ret    

001036a3 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1036a3:	55                   	push   %ebp
  1036a4:	89 e5                	mov    %esp,%ebp
  1036a6:	e8 d1 cb ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1036ab:	05 a5 b2 00 00       	add    $0xb2a5,%eax
    b->cnt ++;
  1036b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036b3:	8b 40 08             	mov    0x8(%eax),%eax
  1036b6:	8d 50 01             	lea    0x1(%eax),%edx
  1036b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036bc:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1036bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036c2:	8b 10                	mov    (%eax),%edx
  1036c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036c7:	8b 40 04             	mov    0x4(%eax),%eax
  1036ca:	39 c2                	cmp    %eax,%edx
  1036cc:	73 12                	jae    1036e0 <sprintputch+0x3d>
        *b->buf ++ = ch;
  1036ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036d1:	8b 00                	mov    (%eax),%eax
  1036d3:	8d 48 01             	lea    0x1(%eax),%ecx
  1036d6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1036d9:	89 0a                	mov    %ecx,(%edx)
  1036db:	8b 55 08             	mov    0x8(%ebp),%edx
  1036de:	88 10                	mov    %dl,(%eax)
    }
}
  1036e0:	90                   	nop
  1036e1:	5d                   	pop    %ebp
  1036e2:	c3                   	ret    

001036e3 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1036e3:	55                   	push   %ebp
  1036e4:	89 e5                	mov    %esp,%ebp
  1036e6:	83 ec 18             	sub    $0x18,%esp
  1036e9:	e8 8e cb ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  1036ee:	05 62 b2 00 00       	add    $0xb262,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1036f3:	8d 45 14             	lea    0x14(%ebp),%eax
  1036f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1036f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036fc:	50                   	push   %eax
  1036fd:	ff 75 10             	pushl  0x10(%ebp)
  103700:	ff 75 0c             	pushl  0xc(%ebp)
  103703:	ff 75 08             	pushl  0x8(%ebp)
  103706:	e8 0b 00 00 00       	call   103716 <vsnprintf>
  10370b:	83 c4 10             	add    $0x10,%esp
  10370e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103711:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103714:	c9                   	leave  
  103715:	c3                   	ret    

00103716 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103716:	55                   	push   %ebp
  103717:	89 e5                	mov    %esp,%ebp
  103719:	83 ec 18             	sub    $0x18,%esp
  10371c:	e8 5b cb ff ff       	call   10027c <__x86.get_pc_thunk.ax>
  103721:	05 2f b2 00 00       	add    $0xb22f,%eax
    struct sprintbuf b = {str, str + size - 1, 0};
  103726:	8b 55 08             	mov    0x8(%ebp),%edx
  103729:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10372c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10372f:	8d 4a ff             	lea    -0x1(%edx),%ecx
  103732:	8b 55 08             	mov    0x8(%ebp),%edx
  103735:	01 ca                	add    %ecx,%edx
  103737:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10373a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103741:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103745:	74 0a                	je     103751 <vsnprintf+0x3b>
  103747:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10374a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10374d:	39 d1                	cmp    %edx,%ecx
  10374f:	76 07                	jbe    103758 <vsnprintf+0x42>
        return -E_INVAL;
  103751:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103756:	eb 22                	jmp    10377a <vsnprintf+0x64>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103758:	ff 75 14             	pushl  0x14(%ebp)
  10375b:	ff 75 10             	pushl  0x10(%ebp)
  10375e:	8d 55 ec             	lea    -0x14(%ebp),%edx
  103761:	52                   	push   %edx
  103762:	8d 80 53 4d ff ff    	lea    -0xb2ad(%eax),%eax
  103768:	50                   	push   %eax
  103769:	e8 74 fb ff ff       	call   1032e2 <vprintfmt>
  10376e:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  103771:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103774:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103777:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10377a:	c9                   	leave  
  10377b:	c3                   	ret    

0010377c <__x86.get_pc_thunk.di>:
  10377c:	8b 3c 24             	mov    (%esp),%edi
  10377f:	c3                   	ret    
