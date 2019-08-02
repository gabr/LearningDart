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
main() {
  // type infer
  var printIntegerNumber = 17;
  printInteger(printIntegerNumber);

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
  // podstawowe operacje takie jak +,-,/,*, abs(), ceil(0, floor(), ale takie
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


  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}

printInteger(int number) {
  // both ' and " works
  print('The number is $number.');
  print("The number is $number.");
  print("Expression ${1+number}");
}

