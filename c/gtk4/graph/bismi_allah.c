//in the name of Allah

#include <stdio.h>
#include <gtk/gtk.h>

static void activate(GtkApplication* app, gpointer user_data);
static void say_bismi_allah(GtkWidget* widget, gpointer data);

int main(int argc, char **argv)
{
    GtkApplication *app;
    int status;

    app = gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
    status = g_application_run (G_APPLICATION (app), argc, argv);
    g_object_unref (app);

    return status;
}

static void activate(GtkApplication* app, gpointer user_data)
{
    GtkWidget *window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "Window");
    gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);

    GtkWidget* lm = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), lm);


    GtkWidget* but1 = gtk_button_new_with_label("in the name of Allah");
    gtk_box_append(GTK_BOX(lm), but1);
    g_signal_connect(but1, "clicked", G_CALLBACK(say_bismi_allah), NULL);

    GtkWidget* but2 = gtk_button_new_with_label("in the name of Allah");
    gtk_box_append(GTK_BOX(lm), but2);

    gtk_window_present (GTK_WINDOW (window));
}

static void say_bismi_allah(GtkWidget* widget, gpointer data)
{
    g_print("in the name of Allah\n");
}

