#autorka: Julia Kończal
using Plots

#Zadanie domowe rozbiłam na dwie funkcje: liczącą pierwiastki oraz robiącą animację, krótki opis tych funkcji:
#liczenie_pierwiastkow : podajemy liczbę z, z której pierwiastki chcemy liczyć oraz n - stopień pierwiastka. Jeśli n nie jest dodatnią liczbą całkowitą, funkcja zwróci błąd i pierwiastków nie policzy.
#jednak jeśli n jest prawidłowe, to liczy pierwiastki dla zadanego stopnia. W jaki sposób? Korzystam z postaci trygonometrycznej i wzoru, do którego staram się dojść "od środka" dzięki funkcji broadcast

function liczenie_pierwiastkow(z,n)
    if (n>0) && (n isa Integer)
        r = abs(z)
        ϕ = angle(z)
        A = collect(0:n-1)
        B = [2pi/n]
        C = broadcast(*, A, B)
        D = fill(ϕ/n, n)
        argumenty_tryg = broadcast(+, D, C)
        kosinus = broadcast(cos, argumenty_tryg)
        sinusik = broadcast(sin, argumenty_tryg)
        E = fill(0 + 1im, n)
        czesc_urojona = broadcast(*, E, sinusik)
        srodek = broadcast(+, kosinus, czesc_urojona)
        pierwiastki = (abs(z))^(1/n)*srodek
        gotowe = pushfirst!(pierwiastki, z)
        return gotowe
    elseif n <= 0 #stopien pierwiastka musi byc calkowita liczba dodatnia, wiec sprawdzam to w tych dwoch warunkach
        print("Nieprawidłowy stopień pierwiastka, proszę, zmień n na liczbę dodatnią")
    else (n isa Integer) == false
        print("Nieprawidłowy stopień pierwiastka, proszę, zmień n na liczbę całkowitą")
    end
end

#Przykład użycia:
#liczenie_pierwiastkow(1,-3)

#animacja: jeśli n jest prawidłowe, to w zależności od jego wartości otrzymujemy animację prezentującą liczbę oraz jej pierwiastki
function animacja(z,n)
    if n <= 5
        a = @animate for i in 1:length(liczenie_pierwiastkow(z,n))
            scatter!([real(liczenie_pierwiastkow(z,n)[i])], [imag(liczenie_pierwiastkow(z,n)[i])],
                markersize = 5,
                xlim = (-5,5),
                ylim = (-5,5),
                grid = :on,
                xlabel = "ReZ",
                ylabel = "ImZ",
                framestyle = :original,
                label = liczenie_pierwiastkow(z,n)[i],
                title ="Liczba $z oraz jej pierwiastki $n. stopnia"
                )
            end
    elseif (n>5) && (n<=24)
        a = @animate for i in 1:length(liczenie_pierwiastkow(z,n))
            scatter!([real(liczenie_pierwiastkow(z,n)[i])], [imag(liczenie_pierwiastkow(z,n)[i])],
                markersize = 5,
                xlim = (-5,5),
                ylim = (-5,5),
                grid = :on,
                xlabel = "ReZ",
                ylabel = "ImZ",
                framestyle = :original,
                label = liczenie_pierwiastkow(z,n)[i],
                legend = :outerright,
                title ="Liczba $z oraz jej pierwiastki $n. stopnia"
                )
            end
    else n>24
        println("Niestety, tyle podpisów z wartościami nie zmieści się na wykresie, dlatego można przeczytać je tutaj:", liczenie_pierwiastkow(z,n))
        a = @animate for i in 1:length(liczenie_pierwiastkow(z,n))
            scatter!([real(liczenie_pierwiastkow(z,n)[i])], [imag(liczenie_pierwiastkow(z,n)[i])],
                markersize = 5,
                xlim = (-5,5),
                ylim = (-5,5),
                grid = :on,
                xlabel = "ReZ",
                ylabel = "ImZ",
                framestyle = :original,
                legend = :none,
                title ="Liczba $z oraz jej pierwiastki $n. stopnia"
                )
            end
        end
    gif(a, fps=1)
end


#Przykład użycia:
#animacja(-1-1im, 3)
