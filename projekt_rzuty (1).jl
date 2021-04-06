using Gtk, Graphics
using Random
using Plots


#funkcje liczace wszystkie potrzebne rzeczy
#trafienie w cel dla rzutu poziomego

function hor_point(h0, v0, version)
    g = 9.81
    t = sqrt(2*h0/g)
    z = v0 * t
    z_1 = round(z, digits=0)
    point_but = 23 #dla wersji z motylem
    point_tur = 56 #dla zolwia
    point_squ = 91 #dla wiewiorki
    list =[]
    for i in 1:z
        move = h0-((g/2(v0)^2)*i^2)
        push!(list,move)
    end
    if version == "butterfly"
        a = @animate for i in 1:length(list)
            scatter([i], [list[i]],
            color =:black,
            xlim = z < point_but ? (0,point_but+5) : (0,z+5),
            ylim = (0,h0+10),
            xlabel = "positon",
            ylabel = "height",
            label ="Your attempt = ($z_1,0)",
            markersize = 10)
            scatter!([point_but],[0],
                markersize = 10,
                color = :red,
                legend = :best,
                title = "Horizontal throw, mode: point",
                label = "point:($point_but,0)")
        end
        gif(a,"animacja.gif", fps=25)
    elseif version == "turtle"
        a = @animate for i in 1:length(list)
            scatter([i], [list[i]],
            color =:black,
            xlim = z < point_tur ? (0,point_tur+5) : (0,z+5),
            ylim = (0,h0+10),
            xlabel = "positon",
            ylabel = "height",
            label ="Your attempt = ($z_1,0)",
            markersize = 10)
            scatter!([point_tur],[0],
                markersize = 10,
                color = :red,
                legend = :best,
                title = "Horizontal throw, mode: point",
                label = "point:($point_tur,0)")
        end
        gif(a,"animacja.gif", fps=25)
    else version == "squirrel"
        a = @animate for i in 1:length(list)
            scatter([i], [list[i]],
            color =:black,
            xlim = z < point_squ ? (0,point_squ+5) : (0,z+5),
            ylim = (0,h0+10),
            xlabel = "positon",
            ylabel = "height",
            label ="Your attempt = ($z_1,0)",
            markersize = 10)
            scatter!([point_squ],[0],
                markersize = 10,
                color = :red,
                legend = :best,
                title = "Horizontal throw, mode: point",
                label = "point:($point_squ,0)")
        end
        gif(a,"animacja.gif", fps=25)
    end
end

#trafienie w cel dla rzutu ukosnego
function obl_point(α0, v0, version)
    g = 9.81
    α = deg2rad(α0)
    t = (2*v0*sin(α))/g
    z = v0 * cos(α) * t
    h = (v0)^2*sin(α)^2/2*g
    point_but = 23 #dla wersji z motylem
    point_tur = 56 #dla zolwia
    point_squ = 91 #dla wiewiorki
    z_1= round(z,digits = 0)
    list = []
    for i in 1:z
        move = i*tan(α)-(g*(i^2))/(2*(v0)^2*(cos(α)^2))
        push!(list, move)
    end
    if version == "butterfly"
        a = @animate for i in 1:length(list)
            scatter([i], [list[i]],
            color =:black,
            xlim = z < point_but ? (0,point_but+5) : (0,z+5),
            ylim = (0, 100),
            xlabel = "positon",
            ylabel = "height",
            label ="Your attempt = ($z_1,0)",
            markersize = 10)
            scatter!([point_but],[0],
                markersize = 10,
                color = :red,
                legend = :best,
                title = "Oblique throw, mode: point",
                label = "point:($point_but,0)")
        end
        gif(a,"animacja.gif", fps=25)
    elseif version == "turtle"
        a = @animate for i in 1:length(list)
            scatter([i], [list[i]],
            color =:black,
            xlim = z < point_tur ? (0,point_tur+5) : (0,z+5),
            ylim = (0, 100),
            xlabel = "positon",
            ylabel = "height",
            label ="Your attempt = ($z_1,0)",
            markersize = 10)
            scatter!([point_tur],[0],
                markersize = 10,
                color = :red,
                legend = :best,
                title = "Oblique throw, mode: point",
                label = "point:($point_tur,0)")
        end
        gif(a,"animacja.gif", fps=25)
    else version == "squirrel"
        a = @animate for i in 1:length(list)
            scatter([i], [list[i]],
            color =:black,
            xlim = z < point_squ ? (0,point_squ+5) : (0,z+5),
            ylim = (0, 100),
            xlabel = "positon",
            ylabel = "height",
            label ="Your attempt = ($z_1,0)",
            markersize = 10)
            scatter!([point_squ],[0],
                markersize = 10,
                color = :red,
                legend = :best,
                title = "Oblique throw, mode: point",
                label = "point:($point_squ,0)")
        end
        gif(a,"animacja.gif", fps=25)
    end
end

#omieniecie przeciwnikow rzut poziomy
function hor_enem(h0, v0, difficulty, version)
    println("makaron")
    #easy butterfy
    a1 = 20
    a2 = 30
    b1 = 20
    b2 = 50
    #easy turtle
    c1 = 60
    c2 = 30
    d1 = 30
    d2 = 10
    #easy squirrel
    e1 = 20
    e2 = 15
    f1 = 25
    f2 = 10
    #hard butterfly
    g1 = 25
    g2 = 50
    h1 = 55
    h2 = 45
    i1 = 60
    i2 = 45
    j1 = 80
    j2 = 20
    #hard turtle
    k1 = 50
    k2 = 70
    l1 = 60
    l2 = 65
    m1 = 70
    m2 = 60
    n1 = 80
    n2 = 55
    #hard squirrel
    o1 = 30
    o2 = 50
    p1 = 50
    p2 = 50
    r1 = 70
    r2 = 50
    s1 = 80
    s2 = 50
    #teraz dalej funkcja
    g = 9.81
    t = sqrt(2*h0/g)
    z = v0 * t
    z_1 = round(z, digits=0)
    list =[]
    for i in 1:z
        move = h0-((g/2(v0)^2)*i^2)
        push!(list,move)
    end
    if difficulty == "easy"
        if version == "butterfly"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([a1],[a2],
                markersize = 10,
                legend = :best,
                title = "Horizontal throw, mode: enemy",
                label = "point:")
                scatter!([b1],[b2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        elseif version == "turtle"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([c1],[c2],
                markersize = 10,
                legend = :best,
                title = "Horizontal throw, mode: enemy",
                label = "point:")
                scatter!([d1],[d2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        else version == "squirrel"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([e1],[e2],
                markersize = 10,
                legend = :best,
                title = "Horizontal throw, mode: enemy",
                label = "point:")
                scatter!([f1],[f2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        end
    else difficulty == "hard"
        if version == "butterfly"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([g1],[g2],
                markersize = 10,
                legend = :best,
                title = "Oblique throw, mode: enemy",
                label = "point:")
                scatter!([h1],[h2],
                markersize = 10)
                scatter!([i1],[i2],
                markersize = 10)
                scatter!([j1],[j2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        elseif version == "turtle"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([k1],[k2],
                markersize = 10,
                legend = :best,
                title = "Oblique throw, mode: enemy",
                label = "point:")
                scatter!([l1],[l2],
                markersize = 10)
                scatter!([m1],[m2],
                markersize = 10)
                scatter!([n1],[n2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        else version == "squirrel"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([o1],[o2],
                markersize = 10,
                legend = :best,
                title = "Oblique throw, mode: enemy",
                label = "point:")
                scatter!([p1],[p2],
                markersize = 10)
                scatter!([r1],[r2],
                markersize = 10)
                scatter!([s1],[s2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        end
    end
end


#omieniecie przeciwnikow rzut ukosny
function obl_enem(α0, v0, difficulty, version)
    #easy butterfly
    a1 = 20
    a2 = 30
    b1 = 20
    b2 = 40
    #easy turtle
    c1 = 15
    c2 = 30
    d1 = 25
    d2 = 10
    #easy squirrel
    e1 = 18
    e2 = 19
    f1 = 40
    f2 = 19
    #hard butterfly
    g1 = 10
    g2 = 50
    h1 = 35
    h2 = 55
    i1 = 60
    i2 = 40
    j1 = 65
    j2 = 50
    #hard turtle
    k1 = 20
    k2 = 70
    l1 = 40
    l2 = 65
    m1 = 60
    m2 = 60
    n1 = 80
    n2 = 55
    #hard squirrel
    o1 = 25
    o2 = 40
    p1 = 43
    p2 = 88
    r1 = 63
    r2 = 33
    s1 = 85
    s2 = 15
    #i funkcja
    g = 9.81
    α = deg2rad(α0)
    t = (2*v0*sin(α))/g
    z = v0 * cos(α) * t
    h = (((v0)^2)*(sin(α)^2))/(2*g)
    z_1= round(z,digits = 2)
    list = []
    for i in 1:z
        move = i*tan(α)-(g*(i^2))/(2*(v0)^2*(cos(α)^2))
        push!(list, move)
    end
    if difficulty == "easy"
        if version == "butterfly"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([a1],[a2],
                markersize = 10,
                legend = :best,
                title = "Horizontal throw, mode: enemy",
                label = "point:")
                scatter!([b1],[b2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        elseif version == "turtle"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([c1],[c2],
                markersize = 10,
                legend = :best,
                title = "Horizontal throw, mode: enemy",
                label = "point:")
                scatter!([d1],[d2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        else version == "squirrel"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([e1],[e2],
                markersize = 10,
                legend = :best,
                title = "Horizontal throw, mode: enemy",
                label = "point:")
                scatter!([f1],[f2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        end
    else difficulty == "hard"
        if version == "butterfly"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([g1],[g2],
                markersize = 10,
                legend = :best,
                title = "Oblique throw, mode: enemy",
                label = "point:")
                scatter!([h1],[h2],
                markersize = 10)
                scatter!([i1],[i2],
                markersize = 10)
                scatter!([j1],[j2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        elseif version == "turtle"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([k1],[k2],
                markersize = 10,
                legend = :best,
                title = "Oblique throw, mode: enemy",
                label = "point:")
                scatter!([l1],[l2],
                markersize = 10)
                scatter!([m1],[m2],
                markersize = 10)
                scatter!([n1],[n2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        else version == "squirrel"
            a = @animate for i in 1:length(list)
                scatter([i], [list[i]],
                color =:black,
                xlim = (0,100),
                ylim = (0,100),
                xlabel = "positon",
                ylabel = "height",
                label ="Your attempt = ($z_1,0)",
                markersize = 10)
                scatter!([o1],[o2],
                markersize = 10,
                legend = :best,
                title = "Oblique throw, mode: enemy",
                label = "point:")
                scatter!([p1],[p2],
                markersize = 10)
                scatter!([r1],[r2],
                markersize = 10)
                scatter!([s1],[s2],
                markersize = 10)
            end
            gif(a,"animacja.gif", fps=25)
        end
    end
end


 #funkcja ktora wszystko pobiera i odpala co trzeba
 #najpierw sobie pobiore wszystkie odpowiedzi z combobox
 function starting(widget)
     throw = Gtk.bytestring( GAccessor.active_text(projection_choice))
     difficulty = Gtk.bytestring( GAccessor.active_text(difficulty_choice))
     mode = Gtk.bytestring( GAccessor.active_text(mode_choice))
     version = Gtk.bytestring( GAccessor.active_text(version_choice))
     h0_value = get_gtk_property(h0, :text, String)
     v0_value = get_gtk_property(v0, :text, String)
     α0_value = get_gtk_property(α, :text, String)
     h0_value = parse(Float64, h0_value)
     v0_value = parse(Float64, v0_value)
     α0_value = parse(Float64, α0_value)
     if throw == "horizontal"
         if mode == "point"
             hor_point(h0_value, v0_value, version) #dziala
         else mode == "enemy"
             hor_enem(h0_value, v0_value, difficulty, version) #dziala
         end
     else throw == "oblique"
         if mode == "point"
             obl_point(α0_value, v0_value, version) #dziala
         else mode == "enemy"
             obl_enem(α0_value, v0_value, difficulty, version)
         end
     end
     animation = GtkImage("animacja.gif")
     push!(v, animation)
     showall(v)
 end

#samo okienko

win = GtkWindow("Angry dots", 900, 900)
v = GtkBox(:v)
push!(win,v)

#menu jeśli będziemy potrafiły możemy zrobić tablice z najlepszymi wynikami
menu_bar = GtkMenuBar()
file = GtkMenuItem("Game")
filemenu = GtkMenu(file)
menu_quit = GtkMenuItem("Quit")
score = GtkMenuItem("Score")
push!(v, menu_bar)
push!(filemenu,score)
push!(menu_bar, file)
push!(filemenu, menu_quit)
#menu z instrukcjami


#wybór rodzaju rzutu
label_00 = GtkLabel("Select throw")
projection_choice = GtkComboBoxText()
projections = ["horizontal", "oblique"]
for projection in projections
    push!(projection_choice, projection)
end
#signal_connect(projection_choice, "changed") do widget, others...
#    idx = get_gtk_property(projection_choice, "active", Int)
#    str = Gtk.string( GAccessor.active_text(projection_choice) )

#end
label_02 = GtkLabel("Select version")
version_choice = GtkComboBoxText()
versions = ["butterfly", "turtle", "squirrel"]
for version in versions
    push!(version_choice, version)
end

label_03 = GtkLabel("Select difficulty")
difficulty_choice = GtkComboBoxText()
difficulty = ["easy", "hard"]
for difficulty in difficulty
    push!(difficulty_choice, difficulty)
end
label_04 = GtkLabel("Select mode")
mode_choice = GtkComboBoxText()
modes = ["enemy", "point"]
for mode in modes
    push!(mode_choice, mode)
end

#okienka do wprowadzania danych
label_1 = GtkLabel("Enter height")
h0 = GtkEntry()
set_gtk_property!(h0,:text, "")
label_2= GtkLabel("Enter velocity")
v0 = GtkEntry()
set_gtk_property!(v0,:text,"")
label_3=GtkLabel("Enter angle")
α = GtkEntry()
set_gtk_property!(α,:text,"")
button = GtkButton("Start")

id = signal_connect(starting, button, "clicked")


#dodajemy wszystko do okna i odpalamy
push!(v, label_04)
push!(v, mode_choice)

push!(v,label_00)
push!(v,projection_choice)

push!(v, label_03)
push!(v, difficulty_choice)


push!(v,label_02)
push!(v, version_choice)
push!(v,label_1)
push!(v, h0)
push!(v,label_2)
push!(v, v0)
push!(v,label_3)
push!(v, α)


push!(v, button)


showall(win)
