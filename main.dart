/*
  Notatki z: https://dart.dev/guides/language/language-tour

  Ważne koncepcje:

  1. Wszystko jest obiektem, nawet int i null.  Zmienne przechowują tylko i
  wyłącznie obiekty i wszystkie obiekty dziedziczą po Object.  Obiekty są
  budowane z klas.

  2. Silne typowanie ale pisanie typów nie jest konieczne w większości miejsc
  bo jest inferencja typów.

  3. Można pisać funkcje w głównym zakresie top-level functions tak samo jak i
  zmienne, nie musimy mieć tylko obiektów.  Można też tworzyć funkcje wewnątrz
  funkcji.  Zmienne też mogą być gdziekolwiek: top-level, w funkcjach, w
  klasach (wtedy to są pola).

  4. Nie ma public, protected i private.  Zamiast tego to co ma być prywatne
  poprzedzane jest podłogą _

  5. Są wyrażenia i instrukcje
      if                   - instrukcja
      cond ? expr1 : expr2 - wyrażenie

  6. Narzędzia Dart'a zgłaszają błędy i ostrzeżenia.  Błędy mogą być podczas
  kompilacji lub podczas działania programu.  Błędy podczas działania programu
  powodują rzucenie wyjątku.


  Słowa kluczowe:

    abstract
    dynamic
    implements
    show
    as
    else
    import
    static
    assert
    enum
    in
    super
    async
    export
    interface
    switch
    await
    extends
    is
    sync
    break
    external
    library
    this
    case
    factory
    mixin
    throw
    catch
    false
    new
    true
    class
    final
    null
    try
    const
    finally
    on
    typedef
    continue
    for
    operator
    var
    covariant
    Function
    part
    void
    default
    get
    rethrow
    while
    deferred
    hide
    return
    with
    do
    if
    set
    yield

*/

// komentarz
// każdy program musi mieć main()
// main zwraca void i może przyjmować opcjonalne List<String> z arumentami
main(args) {
  print("Args: $args");

  // zmienne
  var varName = 'Bob'; // wywnioskowany typ to String
  // tutaj celowo wymuszamy by zmienna mogła
  // przechowywać więcej niż tylko Stringi:
  dynamic dynamicName = 'Bob';
  String stringName = 'Bob'; // ręczne ustawianie typu

  // domyślna wartość wszystkich zmiennych to null, nawet liczb
  int n;
  // żeby assert rzucał wyjątek trzeba go włączyć argumentem --enable-asserts
  // i ten argument musi być podany przed nazwą pliku
  assert(n == null);


  // Różnica między final a const jest tak, że do final można zapisać
  // wartość, ale tylko raz, a const jest stałą już w czasie kompilacji.
  // final jest więc używany do przechowywania obiektów tworzonych za pomocą
  // konstruktorów
  final finalNumberWithoutTypedType = 7 + 1;
  final int finalNumberWithExplicitlyTypedType = 8;
  //final var finalNumberWithVar = 8; <-- tak nie można
  const constValue = 8 * 1.23;
  const double constDouble = 3.14;
  //const nullValue; <-- tak nie można, nie można mieć nullowego consta

  // można też do niestałej zmiennej wrzucić stałą wartość, np:
  var variableWithConstantValue = const [];
  variableWithConstantValue = [1, 2, 3]; // ok, ta zmienna jest var
  final finalVariableWithConstantValue = const [];
  //finalVariableWithConstantValueA = [1, 2, 3]; // error, ta zmienna jest final
  const constArray = []; // to samo co = const []

  // wbudowane typy: numbers, strings, booleans, lists/arrays, sets,
  //                 maps, runes (for unicode characters), symbols

  // numbers
  // Dwa typy: int i double, oba dziedziczą po typie num, który definiuje
  // podstawowe operacje takie jak +,-,/,*, abs(), ceil(), floor(), ale takie
  // operatory jak przesunięcia bitowe >> są tylko w int
  // Jeżeli typy liczbowe nie mają jakiejś funkcji matematycznej, to znajdzie
  // się ona pewnie w dart:math https://api.dart.dev/stable/dart-math
  var intNumber = 1;
  var hexNumber = 0xDEADBE;
  var doubleNumber = 1.1;
  double forcedDouble = 1; // działa od Dart 2.1
  var scientificNotation = 1.42e5;

  // zamiana stringów na liczby i odwrotnie
  var intFromString = int.parse('1');
  assert(intFromString == 1);
  var doubleFromString = double.parse('1.1');
  assert(doubleFromString == 1.1);
  var stringFromInt = 1.toString();
  assert(stringFromInt == '1');
  var stringFromDouble = 3.145245.toStringAsFixed(2);
  assert(stringFromDouble == '3.15'); // zaokrąglenie

  assert((3 << 1) == 6);
  assert((3 >> 1) == 1);
  assert((3 |  4) == 7);

  // wartości które da się obliczyć w czasie kompilacji są stałymi obliczanymi
  // w czasie kompilacji:
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;


  // strings
  // Dart obsługuje wszystkie napisy jako UTF-16
  // Napisy można tworzyć pojedynczym i podwójnym apostrofem
  var s = 'string interpolation';
  assert('Test $s' == 'Test ' + s);
  assert('Test ${s.toUpperCase()}' == 'Test STRING INTERPOLATION');

  // działa też z trzema """
  const multilineString = '''
  Bla bla
  Tra la la
  ''';
  const secondMultilineString = """First line
  second line""";

  const rawString = r'In this string ${nothing} is i\n\te\rpreted';
  print(rawString);
  // manipulacja poszczególnymi znakami jest
  // obsługiwana przez Runes opisane niżej

  // więcej o manipulacji stringami:
  // https://dart.dev/guides/libraries/library-tour#strings-and-regular-expressions


  // booleans
  // true/false
  // nie można używać zwykłych wartości do sprawdzania prawda/fałsz tak jak
  // w JavaScript if([]) nie zadziała, trzeba zrobić równanie do konkretnej
  // wartości if([] == [])
  const emptyString = '';
  assert(emptyString.isEmpty);
  const numberZero = 0;
  assert(numberZero <= 0);
  var nullValue;
  assert(nullValue == null);
  const nanValue = 0 / 0;
  assert(nanValue.isNaN);

  // lists
  // nie ma rozróżnienia na tablice i listy, jest tylko jedna struktura List
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2); // zero based indexing
  list[0] = 0;
  assert(list[0] == 0);
  // Dart ma operator trzech kropek ... pozwalający rozbijać listę i
  // przekazywać wiele parametrów na raz, w ten sposób można łączyć np kilka
  // list razem
  final extendedList = [0, 1, 2, ...list];
  assert(extendedList.length == 6);
  // aby uniknąć potencjalnych błędów jeżeli rozwijana lista może być nullem
  // można użyć operatora ...?
  var nullList;
  final nullExtendedList = [0, 1, 2, ...?nullList];
  assert(nullExtendedList.length == 3);
  // operatory trzech kropek nie są wspierane w zmiennych
  // typu const, ale działają z final

  // od Dart 2.3 można również wewnątrz listy używać konstrukcji if i for
  var ifInList = [
    'First',
    'Second',
    if (1 == 1) 'Thrid'
  ];

  var fromOneToTen = [for (var i = 1; i <= 10; i++) i];
  var stringsList = [
    'start',
    for (var i in fromOneToTen) 'number $i',
    'end'
  ];
  assert(stringsList.length == 12);

  // więcej na: https://github.com/dart-lang/language/blob/master/accepted/2.3/control-flow-collections/feature-specification.md


  // sets
  // kolekcja unikatowych elementów bez określonej kolejności
  final halogensSet = {'florine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var emptySet = <String>{};
  // Set<string> emptySet = {}; zadziała tak samo
  // var thisIsNotASetButAMap = {}; to tworzy mapę/słownik a nie zbiór
  // Niepodanie typu w powyższym stworzy typ Map<dynamic, dynamic>
  emptySet.add('firstItem');
  emptySet.addAll(halogensSet);
  assert(emptySet.length == halogensSet.length + 1);
  const constSet = { 'a', 'b', 'c' };

  // maps
  const firstMap = {
    'a': 1,
    'b': 2,
    'c': 3,
  };
  // słowo kluczowe 'new' jest opcjonalne
  // nie trzeba więc pisać new Map()
  final mapByConstructor = Map();
  mapByConstructor['name'] = 'Bruce';
  mapByConstructor['nick'] = 'Batman';
  assert(mapByConstructor.length == 2);

  // od Dart 2.3 mapy wspierają ... i ...?
  final bigMap = { 'start': 0, ...firstMap };


  // Runes
  // określanie znaku unicode robimy poprzez \u0000 np \u2665
  // aby wyciągnąć Runy ze stringu na można używać metod codeUnitAt(),
  // codeUnit(), lub można użyć właściwości runes by dostać listę wszystkich
  // Run w stringu
  const clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  final runes = Runes('\u2665 \u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1f44d}');
  print(new String.fromCharCodes(runes));

  // symbols
  // symbol to takie globalne enumy, odpowiednik symboli z lispa
  // warto go używać gdy się kompiluje do java scriptu bo tam podczas
  // procesu mimifikacji nazwy zmiennych się zmieniają, ale wartości symboli
  // już nie
  var symbol = #firstSymbol;
  assert(symbol == #firstSymbol);

  // funkcje potrafią domyślić się swojego typu zwracanego
  printInteger(int number) {
    // both ' and " works
    print('The number is $number.');
    print("The number is $number.");
    print("Expression ${1+number}");
  }

  var printIntegerNumber = 17;
  printInteger(printIntegerNumber);

  bool isEven(int number) {
    return number % 2 == 0;
  }

  bool isOdd(int number) => number % 2 != 0;

  final areEqual = (a) => (b) => a == b;
  assert(areEqual(1)(1)     == true);
  assert(areEqual(1)(2)     == false);
  assert(areEqual(1.1)(1.1) == true);
  assert(areEqual(1.1)(2.1) == false);

  final isZero = areEqual(0);
  assert(isZero(1 - 1) == true);
  assert(isZero(1 - 2) == false);

  // funkcje mogą mieć opcjonalne nazwane parametry poprzez zawarcie ich
  // w nawiasach klamrowych
  void enableFlags({bool bold, bool hidden}) {
    if (bold)   print("bold enabled");
    if (hidden) print("hidden enabled");
  }
  enableFlags(bold: true, hidden: false);

  // pomiom że są to parametry opcjonalne, to można je opisać jako wymagane
  // dużo bibliotek i frameworków tak robi
  // Wydaje mi się jednak, że działa to tylko dla konstruktorów klas.
  // Poniższe linjki mimo że zgodne z dokumentacją rzucają mi błędy,
  // że getter nie został znaleziony.
  //void foo({@required String path, @required String mode}) {
  //  print('opening file $path whth mode $mode');
  //}

  // opcjonalne parametry pozycyjne []
  void optionalPositionalParam(int i, [int b]) {
    print('i: $i${(b == null ? "" : ", b: $b")}');
  }
  optionalPositionalParam(1);
  optionalPositionalParam(1, 2);

  // parametry z wartościami domyślnymi,
  // ale tylko parametry opcjonalne {} lub [] mogą mieć wartości domyślne
  void sayHi(String name, [String prefix = "Hi "]) {
    print("$prefix $name");
  }
  sayHi("Arek");
  sayHi("Arek", "Hello");

  // kaskadowanie .. pozwala na wykonywanie wielu operacji na
  // pojedynczym obiekcie
  final sortedArrayWithAddedZero = [ 1, 3, -2, 3, 4]
    ..sort()
    ..add(0);
  print(sortedArrayWithAddedZero);

  // funckeje anonimowe (params) { body }
  // podobne do arrow functions (params) => expression
  ['apples', 'bananas', 'oranges'].forEach((fruit) {
    print('eating $fruit');
  });


  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}

