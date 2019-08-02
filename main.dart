/*
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
  var number = 17;
  printInteger(number);

  // zmienne
  var name = 'Bob'; // wywnioskowany typ to String
  // tutaj celowo wymuszamy by zmienna mogła
  // przechowywać więcej niż tylko Stringi:
  dynamic dname = 'Bob';
  String sname = 'Bob'; // ręczne ustawianie typu

  // domyślna wartość wszystkich zmiennych to null, nawet liczb
  int n;
  // żeby assert rzucał wyjątek trzeba go włączyć argumentem --enable-asserts
  // i ten argument musi być podany przed nazwą pliku
  assert(n == null);

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

