import type { Metadata } from 'next';
import { JetBrains_Mono } from 'next/font/google';
import './globals.css';
import { loadSiteData } from '@/utils/content-loader';
import { SplashProvider } from '@/components/layout/SplashProvider';
import { Toaster } from '@/components/ui/toast-core';

const jetbrainsMono = JetBrains_Mono({ 
  subsets: ['latin'],
  variable: '--font-mono',
  display: 'swap',
});

export const metadata: Metadata = {
  title: "FinderDev",
  description: "Find developers, discover projects, and build amazing things together",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning className="dark">
      <body className={jetbrainsMono.variable}>
        <SplashProvider>
          {children}
        </SplashProvider>
        <Toaster position="top-right" richColors />
      </body>
    </html>
  );
}

