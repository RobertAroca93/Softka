using Microsoft.EntityFrameworkCore;
using Sofka.Repository.Game.Models;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Context
{
    public partial class SoftkaContext : DbContext
    {
        public SoftkaContext()
        {
        }

        public SoftkaContext(DbContextOptions<SoftkaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Categorias> Categorias { get; set; }
        public virtual DbSet<Juegos> Juegos { get; set; }
        public virtual DbSet<Personas> Personas { get; set; }
        public virtual DbSet<PersonasJuegos> PersonasJuegos { get; set; }
        public virtual DbSet<Preguntas> Preguntas { get; set; }
        public virtual DbSet<Respuestas> Respuestas { get; set; }
        public virtual DbSet<TiposIdentificacion> TiposIdentificacion { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=LAPTOP-MVJM7QIP\\SQLEXPRESS;Database=Softka;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categorias>(entity =>
            {
                entity.HasKey(e => e.IdCategoria);

                entity.Property(e => e.Categoria)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Juegos>(entity =>
            {
                entity.HasKey(e => e.IdJuego);

                entity.Property(e => e.FechaInicio).HasColumnType("datetime");
            });

            modelBuilder.Entity<Personas>(entity =>
            {
                entity.HasKey(e => e.IdPersona);

                entity.Property(e => e.Apellidos)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Identificacion)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Nombres)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.TipoIdentificacionFk).HasColumnName("TipoIdentificacion_FK");

                entity.HasOne(d => d.TipoIdentificacionFkNavigation)
                    .WithMany(p => p.Personas)
                    .HasForeignKey(d => d.TipoIdentificacionFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Personas_TiposIdentificacion");
            });

            modelBuilder.Entity<PersonasJuegos>(entity =>
            {
                entity.HasKey(e => e.IdPersonaJuego);

                entity.Property(e => e.IdJuegoFk).HasColumnName("IdJuego_FK");

                entity.Property(e => e.IdPersonaFk).HasColumnName("IdPersona_FK");

                entity.Property(e => e.IdPreguntaFk).HasColumnName("IdPregunta_FK");

                entity.Property(e => e.IdRespuestaFk).HasColumnName("IdRespuesta_FK");
            });

            modelBuilder.Entity<Preguntas>(entity =>
            {
                entity.HasKey(e => e.IdPregunta);

                entity.Property(e => e.IdCategoriaFk).HasColumnName("IdCategoria_FK");

                entity.Property(e => e.Pregunta)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdCategoriaFkNavigation)
                    .WithMany(p => p.Preguntas)
                    .HasForeignKey(d => d.IdCategoriaFk)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Preguntas_Categorias");
            });

            modelBuilder.Entity<Respuestas>(entity =>
            {
                entity.HasKey(e => e.IdRespuesta);

                entity.Property(e => e.IdPreguntaFk).HasColumnName("IdPregunta_FK");

                entity.Property(e => e.Respuesta)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TiposIdentificacion>(entity =>
            {
                entity.HasKey(e => e.IdTipoIdentificacion);

                entity.Property(e => e.Tipo)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
