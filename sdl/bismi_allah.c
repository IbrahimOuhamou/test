//بسم الله الرحمن الرحيم

#include <stdio.h>
#include <SDL2/SDL.h>

int main(int argc, char *argv[])
{
    printf("in the name of Allah\n");

    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow("la ilaha illa Allah", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 1200, 800, SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if(NULL == window)
    {
        SDL_Log("Error SDL_CreateWindow() %s", SDL_GetError());
        exit(-1);
    }
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC);
    if(NULL == renderer)
    {
        SDL_Log("Error SDL_CreateRenderer() %s", SDL_GetError());
        exit(-1);
    }

    int running = 1;
    while(running)
    {
        SDL_Event event;
        while(SDL_PollEvent(&event))
        {
            switch(event.type)
            {
                case SDL_QUIT: running=0;break;
            }
        }

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}

